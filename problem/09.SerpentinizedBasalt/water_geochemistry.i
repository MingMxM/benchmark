[UserObjects]
    [anorthite_acid]
        type = GeochemistryKineticRate
        kinetic_species_name = Anorthite
        intrinsic_rate_constant = 1.380e-9     # 10^-8.86 mol/m^2/s at 25 C
        activation_energy = 67.83E3            # J/mol
        area_quantity = 0.0225                 # m^2/g
        multiply_by_mass = true
        promoting_species_names = "H+"
        promoting_indices = "0.5"
        one_over_T0 = 0.003354
    []

    [kfeldspar_acid]
        type = GeochemistryKineticRate
        kinetic_species_name = K-feldspar
        intrinsic_rate_constant = 3.548e-10    # 10^-9.45 mol/m^2/s at 25 C
        activation_energy = 51.96E3            # J/mol
        area_quantity = 0.0033                 # m^2/g
        multiply_by_mass = true
        promoting_species_names = "H+"
        promoting_indices = "0.5"
        one_over_T0 = 0.003354
    []

    [albite_acid]
        type = GeochemistryKineticRate
        kinetic_species_name = Albite
        intrinsic_rate_constant = 1.380e-9     # 10^-8.86 mol/m^2/s at 25 C
        activation_energy = 67.83E3             # J/mol
        area_quantity = 0.0225                 # m^2/g
        multiply_by_mass = true
        promoting_species_names = "H+"
        promoting_indices = "0.5"
        one_over_T0 = 0.003354
    []
  
    [diopside_acid]
        type = GeochemistryKineticRate
        kinetic_species_name = Diopside
        intrinsic_rate_constant = 4.365e-7     # 10^-6.36 mol/m^2/s at 25 C
        activation_energy = 96.1E3             # J/mol
        area_quantity = 0.0034                 # m^2/g
        multiply_by_mass = true
        promoting_species_names = "H+"
        promoting_indices = "0.71"
        one_over_T0 = 0.003354
    []

    [hedenbergite_acid]
        type = GeochemistryKineticRate
        kinetic_species_name = Hedenbergite
        intrinsic_rate_constant = 4.365e-7     # 10^-6.36 mol/m^2/s at 25 C
        activation_energy = 96.1E3             # J/mol
        area_quantity = 0.0034                 # m^2/g
        multiply_by_mass = true
        promoting_species_names = "H+"
        promoting_indices = "0.71"
        one_over_T0 = 0.003354
    []

    [greenalite_acid]
        type = GeochemistryKineticRate
        kinetic_species_name = Greenalite
        intrinsic_rate_constant = 9.772e-11    # 10^-10.01 mol/m^2/s at 25 C
        activation_energy = 70.045E3           # J/mol
        area_quantity = 1.26                   # m^2/g
        multiply_by_mass = true
        promoting_species_names = "H+"
        promoting_indices = "0.45"
        one_over_T0 = 0.003354
    []

    [antigorite_acid]
        type = GeochemistryKineticRate
        kinetic_species_name = Antigorite
        intrinsic_rate_constant = 9.772e-11    # 10^-10.01 mol/m^2/s at 25 C
        activation_energy = 70.045E3           # J/mol
        area_quantity = 1.26                   # m^2/g
        multiply_by_mass = true
        promoting_species_names = "H+"
        promoting_indices = "0.45"
        one_over_T0 = 0.003354
    []

    [calcite_acid]
        type = GeochemistryKineticRate
        kinetic_species_name = Calcite
        intrinsic_rate_constant = 0.501187     # 10^-0.3 mol/m^2/s at 25 C
        activation_energy = 14.403E3             # J/mol
        area_quantity = 0.0370                  # m^2/g
        multiply_by_mass = true
        promoting_species_names = "H+"
        promoting_indices = "1.0"
        one_over_T0 = 0.003354
    []

    [magnesite_acid]
        type = GeochemistryKineticRate
        kinetic_species_name = Magnesite
        intrinsic_rate_constant = 4.1687E-7    # 10^-6.38 mol/m^2/s at 25 C
        activation_energy = 14.403E3             # J/mol
        area_quantity = 0.0662                 # m^2/g
        multiply_by_mass = true
        promoting_species_names = "H+"
        promoting_indices = "1.0"
        one_over_T0 = 0.003354
    []

    [siderite_acid]
        type = GeochemistryKineticRate
        kinetic_species_name = Siderite
        intrinsic_rate_constant = 1.8197E-4    # 10^-3.74 mol/m^2/s at 25 C
        activation_energy = 56.019E3             # J/mol
        area_quantity = 0.1050                 # m^2/g
        multiply_by_mass = true
        promoting_species_names = "H+"
        promoting_indices = "0.9"
        one_over_T0 = 0.003354
    []

    [amrphsilica_neutral]
        type = GeochemistryKineticRate
        kinetic_species_name = Amrph^silica
        intrinsic_rate_constant = 1.9953E-10    # 10^-9.7 mol/m^2/s at 25 C
        activation_energy = 79.047E3           # J/mol
        area_quantity = 0.0225                 # m^2/g
        multiply_by_mass = true
        one_over_T0 = 0.003354
    []

    [definition]
        type = GeochemicalModelDefinition
        database_file = "../../database/moose_geochemdb.json"
        basis_species = "H2O H+ Na+ K+ Ca++ Mg++ Fe++ Al+++ SiO2(aq) HCO3-"
        remove_all_extrapolated_secondary_species = true
        kinetic_minerals = "Anorthite K-feldspar Albite Diopside Hedenbergite Greenalite Antigorite Calcite Magnesite Siderite Amrph^silica"
        equilibrium_gases = "CO2(g)"
        kinetic_rate_descriptions = "anorthite_acid kfeldspar_acid albite_acid diopside_acid hedenbergite_acid greenalite_acid antigorite_acid calcite_acid magnesite_acid siderite_acid amrphsilica_neutral"
    []

    [nodal_void_volume_uo]
      type = NodalVoidVolume
      porosity = porosity
      execute_on = 'initial timestep_end' # "initial" means this is evaluated properly for the first timestep
    []
  []

[SpatialReactionSolver]
    model_definition = definition
    geochemistry_reactor_name = reactor
    charge_balance_species = "HCO3-"
    constraint_species = "H2O              H+               Na+              K+               Ca++               Mg++             Fe++             Al+++            SiO2(aq)         HCO3-"
    constraint_value = "  1.0              1E-7             1E-4             1E-4             1E-4               1E-4             1E-4             1E-6             1E-04            1E-6"
    constraint_meaning = "kg_solvent_water bulk_composition bulk_composition bulk_composition free_concentration bulk_composition bulk_composition bulk_composition bulk_composition bulk_composition"
    constraint_unit = "   kg               moles            moles            moles            molal              moles            moles            moles            moles            moles"
    initial_temperature = 100
    temperature = 100
    kinetic_species_name = '         Anorthite K-feldspar Albite Diopside Hedenbergite Greenalite Antigorite Calcite Magnesite Siderite Amrph^silica'
    kinetic_species_initial_value = '0.5013    1.2999     0.7709 1.038    0.3765       0.1898     0.009801   0.001   0.001     0.001    0.001'
    kinetic_species_unit = '         moles     moles      moles  moles    moles        moles      moles      moles   moles     moles    moles'
    evaluate_kinetic_rates_always = true # implicit time-marching used for stability
    source_species_names = 'H2O H+ Na+ K+ Ca++ Mg++ Fe++ Al+++ SiO2(aq) HCO3-'
    source_species_rates = 'rate_H2O_per_1l rate_H_per_1l rate_Na_per_1l rate_K_per_1l rate_Ca_per_1l rate_Mg_per_1l rate_Fe_per_1l rate_Al_per_1l rate_SiO2_per_1l rate_HCO3_per_1l'
    ramp_max_ionic_strength_initial = 0
    execute_console_output_on = '' # only CSV output used in this example
    add_aux_molal = false # save some memory and reduce variables in output exodus
    add_aux_mg_per_kg = false # save some memory and reduce variables in output exodus
    add_aux_free_mg = false # save some memory and reduce variables in output exodus
    add_aux_activity = false # save some memory and reduce variables in output exodus
    add_aux_bulk_moles = false # save some memory and reduce variables in output exodus
    adaptive_timestepping = true
[]

[Mesh]
  type = MeshGeneratorMesh
  [file]
    type = FileMeshGenerator
    file = benchmark.msh
  []
  [scale_to_m]
    type = TransformGenerator
    input = file
    transform = SCALE
    vector_value = '0.001 0.001 0.001'
  []
[]

[Executioner]
  type = Transient
  [TimeStepper]
    type = FunctionDT
    function = 'max(500, 0.1 * t)'
  []
  end_time = 864000        # 100 day
[]

[AuxVariables]
  [temperature]
    initial_condition = 100
  []
  [porosity]
    initial_condition = 0.7
  []
  [nodal_void_volume]
  []
  [free_cm3_Kfeldspar]
  []
  [free_cm3_Amrphsilica]
  []

# Mass change (kg/s) at each node provided by the porous-flow simulation
  [pf_rate_H2O]
  []
  [pf_rate_H]
  []
  [pf_rate_Na]
  []
  [pf_rate_K]
  []
  [pf_rate_Ca]
  []
  [pf_rate_Mg]
  []
  [pf_rate_Fe]
  []
  [pf_rate_Al]
  []
  [pf_rate_SiO2]
  []
  [pf_rate_HCO3]
  []             

# Molar change (mole/L/s) at each node used in geochemistry simulation
  [rate_H2O_per_1l]
  []
  [rate_H_per_1l]
  []
  [rate_Na_per_1l]
  []
  [rate_K_per_1l]
  []
  [rate_Ca_per_1l]
  []
  [rate_Mg_per_1l]
  []
  [rate_Fe_per_1l]
  []
  [rate_Al_per_1l]
  []
  [rate_SiO2_per_1l]
  []
  [rate_HCO3_per_1l]
  []

# Transported moel of species (moles) at each node used in geochemistry simulation
  [transported_H2O]
  []
  [transported_H]
  []
  [transported_Na]
  []
  [transported_K]
  []
  [transported_Ca]
  []
  [transported_Mg]
  []
  [transported_Fe]
  []
  [transported_Al]
  []
  [transported_SiO2]
  []
  [transported_HCO3]
  []
  [transported_mass]
  []

# Mass fraction at each node used in geochemistry simulation
  [massfrac_H2O]
  []
  [massfrac_H]
  []
  [massfrac_Na]
  []
  [massfrac_K]
  []
  [massfrac_Ca]
  []
  [massfrac_Mg]
  []
  [massfrac_Fe]
  []
  [massfrac_Al]
  []
  [massfrac_SiO2]
  []
  [massfrac_HCO3]
  []
[]

[AuxKernels]
  [free_cm3_Kfeldspar_auxk]
    type = GeochemistryQuantityAux
    reactor = reactor
    species = 'K-feldspar'
    quantity = free_cm3
    variable = free_cm3_Kfeldspar
    execute_on = 'timestep_end'
  []
  [free_cm3_Amrphsilica_auxk]
    type = GeochemistryQuantityAux
    reactor = reactor
    species = 'Amrph^silica'
    quantity = free_cm3
    variable = free_cm3_Amrphsilica
    execute_on = 'timestep_end'
  []

  [porosity_auxk]
    type = ParsedAux
    coupled_variables = 'free_cm3_Anorthite free_cm3_Kfeldspar free_cm3_Albite free_cm3_Diopside free_cm3_Hedenbergite free_cm3_Greenalite free_cm3_Antigorite free_cm3_Calcite free_cm3_Magnesite free_cm3_Siderite free_cm3_Amrphsilica'
    expression = '1000.0 / (1000.0 + free_cm3_Anorthite + free_cm3_Kfeldspar + free_cm3_Albite + free_cm3_Diopside + free_cm3_Hedenbergite + free_cm3_Greenalite + free_cm3_Antigorite + free_cm3_Calcite + free_cm3_Magnesite + free_cm3_Siderite + free_cm3_Amrphsilica)'
    variable = porosity
    execute_on = 'timestep_end'
  []

  [nodal_void_volume_auxk]
    type = NodalVoidVolumeAux
    variable = nodal_void_volume
    nodal_void_volume_uo = nodal_void_volume_uo
    execute_on = 'initial timestep_end' # "initial" to ensure it is properly evaluated for the first timestep
  []

  [rate_H2O_per_1l_auxk]
    type = ParsedAux
    coupled_variables = 'pf_rate_H2O nodal_void_volume'
    variable = rate_H2O_per_1l
    expression = 'pf_rate_H2O / 18.01801802 / nodal_void_volume'
    execute_on = 'timestep_begin'
  []
  [rate_H_per_1l_auxk]
    type = ParsedAux
    coupled_variables = 'pf_rate_H nodal_void_volume'
    variable = rate_H_per_1l
    expression = 'pf_rate_H / 1.0079 / nodal_void_volume'
    execute_on = 'timestep_begin'
  []
  [rate_Na_per_1l_auxk]
    type = ParsedAux
    coupled_variables = 'pf_rate_Na nodal_void_volume'
    variable = rate_Na_per_1l
    expression = 'pf_rate_Na / 22.9898 / nodal_void_volume'
    execute_on = 'timestep_begin'
  []
  [rate_K_per_1l_auxk]
    type = ParsedAux
    coupled_variables = 'pf_rate_K nodal_void_volume'
    variable = rate_K_per_1l
    expression = 'pf_rate_K / 39.0983 / nodal_void_volume'
    execute_on = 'timestep_begin'
  []
  [rate_Ca_per_1l_auxk]
    type = ParsedAux
    coupled_variables = 'pf_rate_Ca nodal_void_volume'
    variable = rate_Ca_per_1l
    expression = 'pf_rate_Ca / 40.08 / nodal_void_volume'
    execute_on = 'timestep_begin'
  []
  [rate_Mg_per_1l_auxk]
    type = ParsedAux
    coupled_variables = 'pf_rate_Mg nodal_void_volume'
    variable = rate_Mg_per_1l
    expression = 'pf_rate_Mg / 24.305 / nodal_void_volume'
    execute_on = 'timestep_begin'
  []
  [rate_Fe_per_1l_auxk]
    type = ParsedAux
    coupled_variables = 'pf_rate_Fe nodal_void_volume'
    variable = rate_Fe_per_1l
    expression = 'pf_rate_Fe / 55.845 / nodal_void_volume'
    execute_on = 'timestep_begin'
  []
  [rate_Al_per_1l_auxk]
    type = ParsedAux
    coupled_variables = 'pf_rate_Al nodal_void_volume'
    variable = rate_Al_per_1l
    expression = 'pf_rate_Al / 26.9815 / nodal_void_volume'
    execute_on = 'timestep_begin'
  []
  [rate_SiO2_per_1l_auxk]
    type = ParsedAux
    coupled_variables = 'pf_rate_SiO2 nodal_void_volume'
    variable = rate_SiO2_per_1l
    expression = 'pf_rate_SiO2 / 60.0843 / nodal_void_volume'
    execute_on = 'timestep_begin'
  []
  [rate_HCO3_per_1l_auxk]
    type = ParsedAux
    coupled_variables = 'pf_rate_HCO3 nodal_void_volume'
    variable = rate_HCO3_per_1l
    expression = 'pf_rate_HCO3 / 61.0171 / nodal_void_volume'
    execute_on = 'timestep_begin'
  []

  [transported_H2O_auxk]
    type = GeochemistryQuantityAux
    variable = transported_H2O
    species = 'H2O'
    quantity = transported_moles_in_original_basis
    execute_on = 'timestep_begin'
  []
  [transported_H_auxk]
    type = GeochemistryQuantityAux
    variable = transported_H
    species = 'H+'
    quantity = transported_moles_in_original_basis
    execute_on = 'timestep_begin'
  []
  [transported_Na_auxk]
    type = GeochemistryQuantityAux
    variable = transported_Na
    species = 'Na+'
    quantity = transported_moles_in_original_basis
    execute_on = 'timestep_begin'
  []
  [transported_K_auxk]
    type = GeochemistryQuantityAux
    variable = transported_K
    species = 'K+'
    quantity = transported_moles_in_original_basis
    execute_on = 'timestep_begin'
  []
  [transported_Ca_auxk]
    type = GeochemistryQuantityAux
    variable = transported_Ca
    species = 'Ca++'
    quantity = transported_moles_in_original_basis
    execute_on = 'timestep_begin'
  []
  [transported_Mg_auxk]
    type = GeochemistryQuantityAux
    variable = transported_Mg
    species = 'Mg++'
    quantity = transported_moles_in_original_basis
    execute_on = 'timestep_begin'
  []
  [transported_Fe_auxk]
    type = GeochemistryQuantityAux
    variable = transported_Fe
    species = 'Fe++'
    quantity = transported_moles_in_original_basis
    execute_on = 'timestep_begin'
  []
  [transported_Al_auxk]
    type = GeochemistryQuantityAux
    variable = transported_Al
    species = 'Al+++'
    quantity = transported_moles_in_original_basis
    execute_on = 'timestep_begin'
  []
  [transported_SiO2_auxk]
    type = GeochemistryQuantityAux
    variable = transported_SiO2
    species = 'SiO2(aq)'
    quantity = transported_moles_in_original_basis
    execute_on = 'timestep_begin'
  []
  [transported_HCO3_auxk]
    type = GeochemistryQuantityAux
    variable = transported_HCO3
    species = 'HCO3-'
    quantity = transported_moles_in_original_basis
    execute_on = 'timestep_begin'
  []
  [transported_mass_auxk]
    type = ParsedAux
    coupled_variables = 'transported_H2O transported_HCO3 transported_Ca transported_Mg transported_SiO2 transported_H transported_Na transported_K transported_Fe transported_Al'
    variable = transported_mass
    expression = 'transported_H2O * 18.01801802 + transported_H * 1.0079 + transported_Na * 22.9898 + transported_K * 39.0983 + transported_Ca * 40.08 + transported_Mg * 24.305 + transported_Fe * 55.845 + transported_Al * 26.9815 + transported_SiO2 * 60.0843 + transported_HCO3 * 61.0171'
    execute_on = 'timestep_end'
  []

  [massfrac_H2O_auxk]
    type = ParsedAux
    coupled_variables = 'transported_H2O transported_mass'
    variable = massfrac_H2O
    expression = 'transported_H2O * 18.01801802 / transported_mass'
    execute_on = 'timestep_end'
  []
  [massfrac_H_auxk]
    type = ParsedAux
    coupled_variables = 'transported_H transported_mass'
    variable = massfrac_H
    expression = 'transported_H * 1.0079 / transported_mass'
    execute_on = 'timestep_end'
  []
  [massfrac_Na_auxk]
    type = ParsedAux
    coupled_variables = 'transported_Na transported_mass'
    variable = massfrac_Na
    expression = 'transported_Na * 22.9898 / transported_mass'
    execute_on = 'timestep_end'
  []
  [massfrac_K_auxk]
    type = ParsedAux
    coupled_variables = 'transported_K transported_mass'
    variable = massfrac_K
    expression = 'transported_K * 39.0983 / transported_mass'
    execute_on = 'timestep_end'
  []
  [massfrac_Ca_auxk]
    type = ParsedAux
    coupled_variables = 'transported_Ca transported_mass'
    variable = massfrac_Ca
    expression = 'transported_Ca * 40.08 / transported_mass'
    execute_on = 'timestep_end'
  []
  [massfrac_Mg_auxk]
    type = ParsedAux
    coupled_variables = 'transported_Mg transported_mass'
    variable = massfrac_Mg
    expression = 'transported_Mg * 24.305 / transported_mass'
    execute_on = 'timestep_end'
  []
  [massfrac_Fe_auxk]
    type = ParsedAux
    coupled_variables = 'transported_Fe transported_mass'
    variable = massfrac_Fe
    expression = 'transported_Fe * 55.845 / transported_mass'
    execute_on = 'timestep_end'
  []
  [massfrac_Al_auxk]
    type = ParsedAux
    coupled_variables = 'transported_Al transported_mass'
    variable = massfrac_Al
    expression = 'transported_Al * 26.9815 / transported_mass'
    execute_on = 'timestep_end'
  []
  [massfrac_HCO3_auxk]
    type = ParsedAux
    coupled_variables = 'transported_HCO3 transported_mass'
    variable = massfrac_HCO3
    expression = 'transported_HCO3 * 61.0171 / transported_mass'
    execute_on = 'timestep_end'
  []
  [massfrac_SiO2_auxk]
    type = ParsedAux
    coupled_variables = 'transported_SiO2 transported_mass'
    variable = massfrac_SiO2
    expression = 'transported_SiO2 * 60.0843 / transported_mass'
    execute_on = 'timestep_end'
  []
[]

[GlobalParams]
  point = '0 0 0'
  reactor = reactor
[]

[Postprocessors]
  [porosity]
    type = PointValue
    variable = porosity
  []
  [pH]
    type = PointValue
    point = '0 0 0'
    variable = pH
  []
  [massfrac_H2O]
    type = PointValue
    variable = massfrac_H2O
  []
  [massfrac_H]
    type = PointValue
    variable = massfrac_H
  []
  [massfrac_Na]
    type = PointValue
    variable = massfrac_Na
  []
  [massfrac_K]
    type = PointValue
    variable = massfrac_K
  []
  [massfrac_Ca]
    type = PointValue
    variable = massfrac_Ca
  []
  [massfrac_Mg]
    type = PointValue
    variable = massfrac_Mg
  []
  [massfrac_Fe]
    type = PointValue
    variable = massfrac_Fe
  []
  [massfrac_Al]
    type = PointValue
    variable = massfrac_Al
  []
  [massfrac_SiO2]
    type = PointValue
    variable = massfrac_SiO2
  []
  [massfrac_HCO3]
    type = PointValue
    variable = massfrac_HCO3
  []

  [cm3_Anorthite]
    type = PointValue
    variable = 'free_cm3_Anorthite'
  []
  [cm3_Kfeldspar]
    type = PointValue
    variable = 'free_cm3_Kfeldspar'
  []
  [cm3_Albite]
    type = PointValue
    variable = 'free_cm3_Albite'
  []
  [cm3_Diopside]
    type = PointValue
    variable = 'free_cm3_Diopside'
  []
  [cm3_Hedenbergite]
    type = PointValue
    variable = 'free_cm3_Hedenbergite'
  []
  [cm3_Greenalite]
    type = PointValue
    variable = 'free_cm3_Greenalite'
  []
  [cm3_Antigorite]
    type = PointValue
    variable = 'free_cm3_Antigorite'
  []
  [cm3_Calcite]
    type = PointValue
    variable = 'free_cm3_Calcite'
  []
  [cm3_Magnesite]
    type = PointValue
    variable = 'free_cm3_Magnesite'
  []
  [cm3_Siderite]
    type = PointValue
    variable = 'free_cm3_Siderite'
  []
  [cm3_Amrphsilica]
    type = PointValue
    variable = 'free_cm3_Amrphsilica'
  []
  [cm3_mineral]
    type = LinearCombinationPostprocessor
    pp_names = 'cm3_Anorthite cm3_Kfeldspar cm3_Albite cm3_Diopside cm3_Hedenbergite cm3_Greenalite cm3_Antigorite cm3_Calcite cm3_Magnesite cm3_Siderite cm3_Amrphsilica'
    pp_coefs = '1 1 1 1 1 1 1 1 1 1 1'
  []
[]

[Outputs]
  exodus = true
  csv = true
[]