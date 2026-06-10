# Diopside (CaMgSi2O6) - dilute NaCl water equilibrium at 100 C, 1 bar
# System: 1 kg water + 6.776 mol diopside (7:3 water:rock volume ratio)
# Reaction: CaMgSi2O6 + 4 H+ = Ca^2+ + Mg^2+ + 2 SiO2(aq) + 2 H2O

[UserObjects]
    [definition]
        type = GeochemicalModelDefinition
        database_file = "../../database/moose_geochemdb.json"
        basis_species = "H2O H+ Ca++ Mg++ SiO2(aq) HCO3-"
        remove_all_extrapolated_secondary_species = true
        equilibrium_minerals = "Diopside Calcite Magnesite"
        # equilibrium_gases = "CO2(g)"
    []
[]

[TimeIndependentReactionSolver]
    model_definition = definition
    geochemistry_reactor_name = reactor
    swap_out_of_basis = "Ca++"
    swap_into_basis = "Diopside"
    charge_balance_species = "HCO3-"
    constraint_species = "H2O              Diopside     H+            Mg++             SiO2(aq)         HCO3-"
    constraint_value = "  1.0              6.776        -6            1E-8             1E-8             1E-8"
    constraint_meaning = "kg_solvent_water free_mineral log10activity bulk_composition bulk_composition bulk_composition"
    constraint_unit = "   kg               moles        dimensionless moles            moles            moles"
    prevent_precipitation = "Calcite Magnesite"
    ramp_max_ionic_strength_initial = 0
    temperature = 100
    # execute_console_output_on = ''
[]

[GlobalParams]
  point = '0 0 0'
  reactor = reactor
[]

[AuxVariables]
  [transported_H2O]      []
  [transported_H]        []
  [transported_Ca]       []
  [transported_Mg]       []
  [transported_SiO2]     []
  [transported_HCO3]     []
  [transported_mass]     []
  [massfrac_H2O]         []
  [massfrac_H]           []
  [massfrac_Ca]          []
  [massfrac_Mg]          []
  [massfrac_SiO2]        []
  [massfrac_HCO3]        []
  [diopside_free_mg]     []
  [diopside_free_cm3]    []
[]

[AuxKernels]
  # Step 1: extract transported moles in original basis
  [transported_H2O_auxk]
    type = GeochemistryQuantityAux
    species = H2O
    variable = transported_H2O
    quantity = transported_moles_in_original_basis
  []
  [transported_H_auxk]
    type = GeochemistryQuantityAux
    species = 'H+'
    variable = transported_H
    quantity = transported_moles_in_original_basis
  []
  [transported_Ca_auxk]
    type = GeochemistryQuantityAux
    species = 'Ca++'
    variable = transported_Ca
    quantity = transported_moles_in_original_basis
  []
  [transported_Mg_auxk]
    type = GeochemistryQuantityAux
    species = 'Mg++'
    variable = transported_Mg
    quantity = transported_moles_in_original_basis
  []
  [transported_SiO2_auxk]
    type = GeochemistryQuantityAux
    species = 'SiO2(aq)'
    variable = transported_SiO2
    quantity = transported_moles_in_original_basis
  []
  [transported_HCO3_auxk]
    type = GeochemistryQuantityAux
    species = 'HCO3-'
    variable = transported_HCO3
    quantity = transported_moles_in_original_basis
  []

  # Free diopside still present in the system (mass and volume)
  [diopside_free_mg_auxk]
    type = GeochemistryQuantityAux
    species = Diopside
    variable = diopside_free_mg
    quantity = free_mg
  []
  [diopside_free_cm3_auxk]
    type = GeochemistryQuantityAux
    species = Diopside
    variable = diopside_free_cm3
    quantity = free_cm3
  []

  # Step 2: total mass (g) = sum of moles * molar mass
  # Molar masses (g/mol): H2O 18.0152, H+ 1.008, Ca++ 40.078, Mg++ 24.305,
  #                       SiO2(aq) 60.0843, HCO3- 61.017
  [transported_mass_auxk]
    type = ParsedAux
    coupled_variables = 'transported_H2O transported_H transported_Ca transported_Mg transported_SiO2 transported_HCO3'
    variable = transported_mass
    expression = 'transported_H2O*18.0152 + transported_H*1.008 + transported_Ca*40.078 + transported_Mg*24.305 + transported_SiO2*60.0843 + transported_HCO3*61.017'
  []

  # Step 3: mass fractions
  [massfrac_H2O_auxk]
    type = ParsedAux
    coupled_variables = 'transported_H2O transported_mass'
    variable = massfrac_H2O
    expression = 'transported_H2O*18.0152 / transported_mass'
  []
  [massfrac_H_auxk]
    type = ParsedAux
    coupled_variables = 'transported_H transported_mass'
    variable = massfrac_H
    expression = 'transported_H*1.008 / transported_mass'
  []
  [massfrac_Ca_auxk]
    type = ParsedAux
    coupled_variables = 'transported_Ca transported_mass'
    variable = massfrac_Ca
    expression = 'transported_Ca*40.078 / transported_mass'
  []
  [massfrac_Mg_auxk]
    type = ParsedAux
    coupled_variables = 'transported_Mg transported_mass'
    variable = massfrac_Mg
    expression = 'transported_Mg*24.305 / transported_mass'
  []
  [massfrac_SiO2_auxk]
    type = ParsedAux
    coupled_variables = 'transported_SiO2 transported_mass'
    variable = massfrac_SiO2
    expression = 'transported_SiO2*60.0843 / transported_mass'
  []
  [massfrac_HCO3_auxk]
    type = ParsedAux
    coupled_variables = 'transported_HCO3 transported_mass'
    variable = massfrac_HCO3
    expression = 'transported_HCO3*61.017 / transported_mass'
  []
[]

[Postprocessors]
  [pH]
    type = PointValue
    point = '0 0 0'
    variable = pH
  []
  [kg_solvent_water]
    type = PointValue
    variable = kg_solvent_H2O
  []
  [molal_OH]
    type = PointValue
    point = '0 0 0'
    variable = 'molal_OH-'
  []
  [molal_Ca]
    type = PointValue
    point = '0 0 0'
    variable = 'molal_Ca++'
  []
  [molal_Mg]
    type = PointValue
    point = '0 0 0'
    variable = 'molal_Mg++'
  []
  [molal_SiO2]
    type = PointValue
    point = '0 0 0'
    variable = 'molal_SiO2(aq)'
  []
  [molal_H]
    type = PointValue
    point = '0 0 0'
    variable = 'molal_H+'
  []
  [molal_HCO3]
    type = PointValue
    point = '0 0 0'
    variable = 'molal_HCO3-'
  []
  [molal_CO3]
    type = PointValue
    point = '0 0 0'
    variable = 'molal_CO3--'
  []
  [molal_CO2aq]
    type = PointValue
    point = '0 0 0'
    variable = 'molal_CO2(aq)'
  []
  [Diopside_free_mg]
    type = PointValue
    point = '0 0 0'
    variable = diopside_free_mg
  []
  [Diopside_free_cm3]
    type = PointValue
    point = '0 0 0'
    variable = diopside_free_cm3
  []
  [massfrac_H2O]
    type = PointValue
    point = '0 0 0'
    variable = massfrac_H2O
  []
  [massfrac_H]
    type = PointValue
    point = '0 0 0'
    variable = massfrac_H
  []
  [massfrac_Ca]
    type = PointValue
    point = '0 0 0'
    variable = massfrac_Ca
  []
  [massfrac_Mg]
    type = PointValue
    point = '0 0 0'
    variable = massfrac_Mg
  []
  [massfrac_SiO2]
    type = PointValue
    point = '0 0 0'
    variable = massfrac_SiO2
  []
  [massfrac_HCO3]
    type = PointValue
    point = '0 0 0'
    variable = massfrac_HCO3
  []
[]

[Outputs]
  csv = true
[]