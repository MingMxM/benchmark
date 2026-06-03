# Serpentinized Basalt - water equilibrium at 100 C, 1 bar
# Minerals: 0.5013 mol Anorthite + 1.299 mol K-feldspar + 0.7709 mol Albite + 1.038 mol Diopside + 0.3765 mol Hedenbergite + 0.1898 mol Greenalite + 0.009801 mol Antigorite  
# System: 1 kg water + 4.185301 mol Basalt (7:3 water:rock volume ratio)

[UserObjects]
    [definition]
        type = GeochemicalModelDefinition
        database_file = "../../database/moose_geochemdb.json"
        basis_species = "H2O H+ Na+ K+ Ca++ Mg++ Fe++ Al+++ SiO2(aq) HCO3-"
        remove_all_extrapolated_secondary_species = true
        equilibrium_minerals = "Anorthite K-feldspar Albite Diopside Hedenbergite Greenalite Antigorite Calcite Magnesite Siderite Amrph^silica"
        equilibrium_gases = "CO2(g)"
    []
[]

[TimeDependentReactionSolver]
    model_definition = definition
    geochemistry_reactor_name = reactor
    swap_out_of_basis = "H+"
    swap_into_basis = "CO2(g)"
    charge_balance_species = "HCO3-"
    constraint_species = "H2O              CO2(g)        Na+              K+               Ca++             Mg++             Fe++             Al+++            SiO2(aq)         HCO3-"
    constraint_value = "  1.0              0.04          1E-4             1E-4             1E-4             1E-4             1E-4             1E-6             1E-4             1E-8"
    constraint_meaning = "kg_solvent_water fugacity      bulk_composition bulk_composition bulk_composition bulk_composition bulk_composition bulk_composition bulk_composition bulk_composition"
    constraint_unit = "   kg               dimensionless moles            moles            moles            moles            moles            moles            moles            moles"
    prevent_precipitation = "Calcite Magnesite Siderite Amrph^silica"
    ramp_max_ionic_strength_initial = 0
    initial_temperature = 100
    temperature = 100
    execute_console_output_on = 'initial timestep_end'
    source_species_names = "Anorthite K-feldspar Albite Diopside Hedenbergite Greenalite Antigorite"
    source_species_rates = "0.5013    1.299      0.7709 1.038    0.3765       0.1898     0.009801"
    solver_info = true
[]

[Executioner]
  type = Transient
  dt = 1
  end_time = 1
[]

[GlobalParams]
  point = '0 0 0'
  reactor = reactor
[]

[AuxVariables]
  [transported_H2O]      []
  [transported_H]        []
  [transported_Na]       []
  [transported_K]        []
  [transported_Ca]       []
  [transported_Mg]       []
  [transported_Fe]       []
  [transported_Al]       []
  [transported_SiO2]     []
  [transported_HCO3]     []
  [transported_mass]     []
  [massfrac_H2O]         []
  [massfrac_H]           []
  [massfrac_Na]          []
  [massfrac_K]           []
  [massfrac_Ca]          []
  [massfrac_Mg]          []
  [massfrac_Fe]          []
  [massfrac_Al]          []
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
  [transported_Na_auxk]
    type = GeochemistryQuantityAux
    species = 'Na+'
    variable = transported_Na
    quantity = transported_moles_in_original_basis
  []
  [transported_K_auxk]
    type = GeochemistryQuantityAux
    species = 'K+'
    variable = transported_K
    quantity = transported_moles_in_original_basis
  []
  [transported_Fe_auxk]
    type = GeochemistryQuantityAux
    species = 'Fe++'
    variable = transported_Fe
    quantity = transported_moles_in_original_basis
  []
  [transported_Al_auxk]
    type = GeochemistryQuantityAux
    species = 'Al+++'
    variable = transported_Al
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
  # Molar masses (g/mol): H2O 18.0152, H+ 1.008, Na+ 22.9898, K+ 39.0983, Ca++ 40.078,
  #                       Mg++ 24.305, Fe++ 55.845, Al+++ 26.9815, SiO2(aq) 60.0843, HCO3- 61.017
  [transported_mass_auxk]
    type = ParsedAux
    coupled_variables = 'transported_H2O transported_H transported_Na transported_K transported_Ca transported_Mg transported_Fe transported_Al transported_SiO2 transported_HCO3'
    variable = transported_mass
    expression = 'transported_H2O*18.0152 + transported_H*1.008 + transported_Na*22.9898 + transported_K*39.0983 + transported_Ca*40.078 + transported_Mg*24.305 + transported_Fe*55.845 + transported_Al*26.9815 + transported_SiO2*60.0843 + transported_HCO3*61.017'
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
  [massfrac_Na_auxk]
    type = ParsedAux
    coupled_variables = 'transported_Na transported_mass'
    variable = massfrac_Na
    expression = 'transported_Na*22.9898 / transported_mass'
  []
  [massfrac_K_auxk]
    type = ParsedAux
    coupled_variables = 'transported_K transported_mass'
    variable = massfrac_K
    expression = 'transported_K*39.0983 / transported_mass'
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
  [massfrac_Fe_auxk]
    type = ParsedAux
    coupled_variables = 'transported_Fe transported_mass'
    variable = massfrac_Fe
    expression = 'transported_Fe*55.845 / transported_mass'
  []
  [massfrac_Al_auxk]
    type = ParsedAux
    coupled_variables = 'transported_Al transported_mass'
    variable = massfrac_Al
    expression = 'transported_Al*26.9815 / transported_mass'
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
  [molal_Na]
    type = PointValue
    point = '0 0 0'
    variable = 'molal_Na+'
  []
  [molal_K]
    type = PointValue
    point = '0 0 0'
    variable = 'molal_K+'
  []
  [molal_Fe]
    type = PointValue
    point = '0 0 0'
    variable = 'molal_Fe++'
  []
  [molal_Al]
    type = PointValue
    point = '0 0 0'
    variable = 'molal_Al+++'
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
  [massfrac_Na]
    type = PointValue
    point = '0 0 0'
    variable = massfrac_Na
  []
  [massfrac_K]
    type = PointValue
    point = '0 0 0'
    variable = massfrac_K
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
  [massfrac_Fe]
    type = PointValue
    point = '0 0 0'
    variable = massfrac_Fe
  []
  [massfrac_Al]
    type = PointValue
    point = '0 0 0'
    variable = massfrac_Al
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