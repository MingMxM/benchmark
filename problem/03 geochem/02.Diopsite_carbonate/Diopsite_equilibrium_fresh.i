# 1.0 透辉石在淡水中的平衡计算（最简单版本）
[GlobalParams]
  point = '0 0 0'
[]

[TimeIndependentReactionSolver]
  model_definition = definition
  geochemistry_reactor_name = reactor
  charge_balance_species = "Cl-"
  swap_out_of_basis = "Ca++"
  swap_into_basis = "Diopside"  
  constraint_species = "H2O              Na+                Cl-              H+               Diopside         Mg++             SiO2(aq)"
  constraint_value = "  1.0              0.1                0.1              1E-4             1.0              1E-10            1E-10"
  constraint_meaning = "kg_solvent_water free_concentration bulk_composition bulk_composition bulk_composition bulk_composition bulk_composition"
  constraint_unit = "   kg               molal              moles            moles            moles            moles            moles"
  temperature = 25
  ramp_max_ionic_strength_initial = 0 # not needed in this simple problem
  stoichiometric_ionic_str_using_Cl_only = true # for comparison with GWB
  abs_tol = 1E-12
[]

[UserObjects]
  [definition]
    type = GeochemicalModelDefinition
    database_file = "../../../database/moose_geochemdb.json"
    basis_species = "H2O Na+ Cl- H+ Ca++ Mg++ SiO2(aq)"
    equilibrium_minerals = "Diopside"
    piecewise_linear_interpolation = true
  []
[]

[AuxVariables]
  [dissolved_diopsite_moles]
  []
[]
[AuxKernels]
  [dissolved_diopsite_moles]
    type = ParsedAux
    coupled_variables = 'bulk_moles_Diopside free_mg_Diopside'
    expression = 'bulk_moles_Diopside - free_mg_Diopside / 1000 / 216.55 '
    variable = dissolved_diopsite_moles
    execute_on = 'timestep_end'
  []
[]

[Postprocessors]
  [pH]
    type = PointValue
    variable = 'pH'
  []
  [solvent_mass]
    type = PointValue
    variable = 'kg_solvent_H2O'
  []
  [molal_Cl-]
    type = PointValue
    variable = 'molal_Cl-'
  []
  [molal_Na+]
    type = PointValue
    variable = 'molal_Na+'
  []
  [molal_Mg++]
    type = PointValue
    variable = 'molal_Mg++'
  []
  [molal_Ca++]
    type = PointValue
    variable = 'molal_Ca++'
  []
  [molal_SiO2(aq)]
    type = PointValue
    variable = 'molal_SiO2(aq)'
  []
  [bulk_H+]
    type = PointValue
    variable = 'bulk_moles_H+'
  []
  [temperature]
    type = PointValue
    variable = 'solution_temperature'
  []
  [dissolved_diopsite_mol]
    type = PointValue
    variable = 'dissolved_diopsite_moles'
  []
  [free_diopsite_mg]
    type = PointValue
    variable = 'free_mg_Diopside'
  []
  [bulk_diopsite_mol]
    type = PointValue
    variable = 'bulk_moles_Diopside'
  []
[]

