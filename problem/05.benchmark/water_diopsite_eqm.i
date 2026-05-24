# Diopsite - pure water equilibrium at 100 C

[UserObjects]
    [definition]
        type = GeochemicalModelDefinition
        database_file = "../../database/moose_geochemdb.json"
        basis_species = "H2O H+ Ca++ Mg++ SiO2(aq) Na+ Cl-"
        equilibrium_minerals = "Diopside Quartz"
    []
[]

[TimeIndependentReactionSolver]
  model_definition = definition
  geochemistry_reactor_name = reactor
  charge_balance_species = "H+"
  swap_out_of_basis = "Ca++"
  swap_into_basis = "Diopside"  
  constraint_species = "H2O               H+               Diopside         Mg++             SiO2(aq)         Na+              Cl-"
  constraint_value = "  1.0               1E-7             6.0              1E-10            1E-10            1E-3             1E-3"
  constraint_meaning = "kg_solvent_water  bulk_composition bulk_composition bulk_composition bulk_composition bulk_composition bulk_composition"
  constraint_unit = "   kg                moles            moles            moles            moles            moles            moles"
  temperature = 25
  ramp_max_ionic_strength_initial = 0 # not needed in this simple problem
  abs_tol = 1E-12
[]

