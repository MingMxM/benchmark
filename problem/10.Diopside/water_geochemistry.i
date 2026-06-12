# Diopside (CaMgSi2O6) - kinetic dissolution at 100 C
# System: 1 kg water + 6.776 mol diopside, in contact with CO2(g) at f = 4E-3 bar
# Kinetic minerals: Diopside, Calcite, Magnesite

[UserObjects]
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
    [diopside_neutral]
        type = GeochemistryKineticRate
        kinetic_species_name = Diopside
        intrinsic_rate_constant = 7.7625e-12   # 10^-11.11 mol/m^2/s at 25 C
        activation_energy = 40.585E3           # J/mol
        area_quantity = 0.0034                 # m^2/g
        multiply_by_mass = true
        one_over_T0 = 0.003354
    []

    [calcite_acid]
        type = GeochemistryKineticRate
        kinetic_species_name = Calcite
        intrinsic_rate_constant = 0.501187      # 10^-0.3 mol/m^2/s at 25 C
        activation_energy = 14.403E3            # J/mol
        area_quantity = 0.0370                  # m^2/g
        multiply_by_mass = true
        promoting_species_names = "H+"
        promoting_indices = "1.0"
        one_over_T0 = 0.003354
    []
    [calcite_neutral]
        type = GeochemistryKineticRate
        kinetic_species_name = Calcite
        intrinsic_rate_constant = 1.5488E-6     # 10^-5.81 mol/m^2/s at 25 C
        activation_energy = 23.514E3            # J/mol
        area_quantity = 0.0370                  # m^2/g
        multiply_by_mass = true
        one_over_T0 = 0.003354
    []

    [magnesite_acid]
        type = GeochemistryKineticRate
        kinetic_species_name = Magnesite
        intrinsic_rate_constant = 4.1687E-7    # 10^-6.38 mol/m^2/s at 25 C
        activation_energy = 14.403E3           # J/mol
        area_quantity = 0.0662                 # m^2/g
        multiply_by_mass = true
        promoting_species_names = "H+"
        promoting_indices = "1.0"
        one_over_T0 = 0.003354
    []
    [magnesite_neutral]
        type = GeochemistryKineticRate
        kinetic_species_name = Magnesite
        intrinsic_rate_constant = 4.5709E-10   # 10^-9.34 mol/m^2/s at 25 C
        activation_energy = 23.514E3           # J/mol
        area_quantity = 0.0662                 # m^2/g
        multiply_by_mass = true
        one_over_T0 = 0.003354
    []

    [definition]
        type = GeochemicalModelDefinition
        database_file = "../../database/moose_geochemdb.json"
        basis_species = "H2O HCO3- Ca++ Mg++ SiO2(aq) H+"
        remove_all_extrapolated_secondary_species = true
        kinetic_minerals = "Diopside Calcite Magnesite"
        equilibrium_gases = "CO2(g)"
        kinetic_rate_descriptions = "diopside_acid diopside_neutral calcite_acid calcite_neutral magnesite_acid magnesite_neutral"
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
    constraint_species = "H2O              HCO3-            Ca++               Mg++               SiO2(aq)           H+"
    constraint_value = "  1.000034         6.183145e-04     1.632678e-04       1.435085e-04       2.897637e-04       1.039185e-06"
    constraint_meaning = "kg_solvent_water bulk_composition free_concentration free_concentration free_concentration free_concentration"
    constraint_unit = "   kg               moles            molal              molal              molal              molal"
    initial_temperature = 100
    temperature = 100
    kinetic_species_name = '         Diopside Calcite Magnesite'
    kinetic_species_initial_value = ' 6.76    0.001   0.001'
    kinetic_species_unit = '         moles    moles   moles'
    evaluate_kinetic_rates_always = true # implicit time-marching used for stability
    source_species_names = 'H2O HCO3- Ca++ Mg++ SiO2(aq) H+'
    source_species_rates = 'rate_H2O_per_1l rate_HCO3_per_1l rate_Ca_per_1l rate_Mg_per_1l rate_SiO2_per_1l rate_H_per_1l'
    ramp_max_ionic_strength_initial = 0
    execute_console_output_on = '' # only CSV output used in this example
    add_aux_molal = true # save some memory and reduce variables in output exodus
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
  end_time = 2.4192e7    # 40 weeks in seconds
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

  [pf_rate_H2O] # change in H2O mass (kg/s) at each node provided by the porous-flow simulation
  []
  [pf_rate_HCO3]
  []
  [pf_rate_Ca]
  []
  [pf_rate_Mg]
  []
  [pf_rate_SiO2]
  []
  [pf_rate_H] # change in H mass (kg/s) at each node provided by the porous-flow simulation
  []

  [rate_H2O_per_1l]
  []
  [rate_HCO3_per_1l]
  []
  [rate_Ca_per_1l]
  []
  [rate_Mg_per_1l]
  []
  [rate_SiO2_per_1l]
  []
  [rate_H_per_1l]
  []

  [transported_H2O]
  []
  [transported_HCO3]
  []
  [transported_Ca]
  []
  [transported_Mg]
  []
  [transported_SiO2]
  []
  [transported_H]
  []
  [transported_mass]
  []

  [massfrac_H2O]
  []
  [massfrac_HCO3]
  []
  [massfrac_Ca]
  []
  [massfrac_Mg]
  []
  [massfrac_SiO2]
  []
  [massfrac_H]
  []
[]

[AuxKernels]
  [porosity_auxk]
    type = ParsedAux
    coupled_variables = 'free_cm3_Diopside free_cm3_Calcite free_cm3_Magnesite'
    expression = '1000.0 / (1000.0 + free_cm3_Diopside + free_cm3_Calcite + free_cm3_Magnesite)'
    variable = porosity
    execute_on = 'timestep_end'
  []

  [nodal_void_volume_auxk]
    type = NodalVoidVolumeAux
    variable = nodal_void_volume
    nodal_void_volume_uo = nodal_void_volume_uo
    execute_on = 'initial timestep_end' # "initial" to ensure it is properly evaluated for the first timestep
  []

  # [massfrac_H_inlet]
  #   type = ConstantAux
  #   variable = massfrac_H
  #   boundary = inlet
  #   value = 0.0008428
  #   execute_on = 'initial timestep_end'
  # []
  # [massfrac_HCO3_inlet]
  #   type = ConstantAux
  #   variable = massfrac_HCO3
  #   boundary = inlet
  #   value = 0.0510
  #   execute_on = 'initial timestep_end'
  # []
  # [massfrac_Ca_inlet]
  #   type = ConstantAux
  #   variable = massfrac_Ca
  #   boundary = inlet
  #   value = 0
  #   execute_on = 'initial timestep_end'
  # []
  # [massfrac_Mg_inlet]
  #   type = ConstantAux
  #   variable = massfrac_Mg
  #   boundary = inlet
  #   value = 0
  #   execute_on = 'initial timestep_end'
  # []
  # [massfrac_SiO2_inlet]
  #   type = ConstantAux
  #   variable = massfrac_SiO2
  #   boundary = inlet
  #   value = 0
  #   execute_on = 'initial timestep_end'
  # []

  [rate_H2O_per_1l_auxk]
    type = ParsedAux
    coupled_variables = 'pf_rate_H2O nodal_void_volume'
    variable = rate_H2O_per_1l
    expression = 'pf_rate_H2O / 18.01801802 / nodal_void_volume'
    execute_on = 'timestep_begin'
  []
  [rate_HCO3_per_1l_auxk]
    type = ParsedAux
    coupled_variables = 'pf_rate_HCO3 nodal_void_volume'
    variable = rate_HCO3_per_1l
    expression = 'pf_rate_HCO3 / 61.0171 / nodal_void_volume'
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
  [rate_SiO2_per_1l_auxk]
    type = ParsedAux
    coupled_variables = 'pf_rate_SiO2 nodal_void_volume'
    variable = rate_SiO2_per_1l
    expression = 'pf_rate_SiO2 / 60.0843 / nodal_void_volume'
    execute_on = 'timestep_begin'
  []
  [rate_H_per_1l_auxk]
    type = ParsedAux
    coupled_variables = 'pf_rate_H nodal_void_volume'
    variable = rate_H_per_1l
    expression = 'pf_rate_H / 1.0079 / nodal_void_volume'
    execute_on = 'timestep_begin'
  []

  [transported_H2O_auxk]
    type = GeochemistryQuantityAux
    variable = transported_H2O
    species = 'H2O'
    quantity = transported_moles_in_original_basis
    execute_on = 'timestep_end'
  []
  [transported_HCO3_auxk]
    type = GeochemistryQuantityAux
    variable = transported_HCO3
    species = 'HCO3-'
    quantity = transported_moles_in_original_basis
    execute_on = 'timestep_end'
  []
  [transported_Ca_auxk]
    type = GeochemistryQuantityAux
    variable = transported_Ca
    species = 'Ca++'
    quantity = transported_moles_in_original_basis
    execute_on = 'timestep_end'
  []
  [transported_Mg_auxk]
    type = GeochemistryQuantityAux
    variable = transported_Mg
    species = 'Mg++'
    quantity = transported_moles_in_original_basis
    execute_on = 'timestep_end'
  []
  [transported_SiO2_auxk]
    type = GeochemistryQuantityAux
    variable = transported_SiO2
    species = 'SiO2(aq)'
    quantity = transported_moles_in_original_basis
    execute_on = 'timestep_end'
  []
  [transported_H_auxk]
    type = GeochemistryQuantityAux
    variable = transported_H
    species = 'H+'
    quantity = transported_moles_in_original_basis
    execute_on = 'timestep_end'
  []
  [transported_mass_auxk]
    type = ParsedAux
    coupled_variables = 'transported_H2O transported_HCO3 transported_Ca transported_Mg transported_SiO2 transported_H'
    variable = transported_mass
    expression = 'transported_H * 1.0079 + transported_HCO3 * 61.0171 + transported_SiO2 * 60.0843 + transported_Ca * 40.08 + transported_Mg * 24.305 + transported_H2O * 18.01801802'
    execute_on = 'timestep_end'
  []

  [massfrac_H2O_auxk]
    type = ParsedAux
    coupled_variables = 'transported_H2O transported_mass'
    variable = massfrac_H2O
    expression = 'transported_H2O * 18.01801802 / transported_mass'
    execute_on = 'timestep_end'
  []
  [massfrac_HCO3_auxk]
    type = ParsedAux
    coupled_variables = 'transported_HCO3 transported_mass'
    variable = massfrac_HCO3
    expression = 'transported_HCO3 * 61.0171 / transported_mass'
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
  [massfrac_SiO2_auxk]
    type = ParsedAux
    coupled_variables = 'transported_SiO2 transported_mass'
    variable = massfrac_SiO2
    expression = 'transported_SiO2 * 60.0843 / transported_mass'
    execute_on = 'timestep_end'
  []
  [massfrac_H_auxk]
    type = ParsedAux
    coupled_variables = 'transported_H transported_mass'
    variable = massfrac_H
    expression = 'transported_H * 1.0079 / transported_mass'
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
    variable = pH
  []

  [kg_solvent_water]
    type = PointValue
    variable = kg_solvent_H2O
    execute_on = 'initial timestep_end'
  []
  [molal_Ca]
    type = PointValue
    point = '0 0 0'
    variable = 'molal_Ca++'
    execute_on = 'initial timestep_end'
  []
  [molal_Mg]
    type = PointValue
    point = '0 0 0'
    variable = 'molal_Mg++'
    execute_on = 'initial timestep_end'
  []
  [molal_SiO2]
    type = PointValue
    point = '0 0 0'
    variable = 'molal_SiO2(aq)'
    execute_on = 'initial timestep_end'
  []
  [molal_H]
    type = PointValue
    point = '0 0 0'
    variable = 'molal_H+'
    execute_on = 'initial timestep_end'
  []
  [molal_HCO3]
    type = PointValue
    point = '0 0 0'
    variable = 'molal_HCO3-'
    execute_on = 'initial timestep_end'
  []
  [molal_CO3]
    type = PointValue
    point = '0 0 0'
    variable = 'molal_CO3--'
    execute_on = 'initial timestep_end'
  []
  [molal_CO2aq]
    type = PointValue
    point = '0 0 0'
    variable = 'molal_CO2(aq)'
    execute_on = 'initial timestep_end'
  []

  [massfrac_H2O]
    type = PointValue
    variable = massfrac_H2O
    execute_on = 'initial timestep_end'
  []
  [massfrac_HCO3]
    type = PointValue
    variable = massfrac_HCO3
    execute_on = 'initial timestep_end'
  []
  [massfrac_Ca]
    type = PointValue
    variable = massfrac_Ca
    execute_on = 'initial timestep_end'
  []
  [massfrac_Mg]
    type = PointValue
    variable = massfrac_Mg
    execute_on = 'initial timestep_end'
  []
  [massfrac_SiO2]
    type = PointValue
    variable = massfrac_SiO2
    execute_on = 'initial timestep_end'
  []
  [massfrac_H]
    type = PointValue
    variable = massfrac_H
    execute_on = 'initial timestep_end'
  []

  [cm3_Diopside]
    type = PointValue
    variable = 'free_cm3_Diopside'
  []
  [cm3_Calcite]
    type = PointValue
    variable = 'free_cm3_Calcite'
  []
  [cm3_Magnesite]
    type = PointValue
    variable = 'free_cm3_Magnesite'
  []
  [cm3_mineral]
    type = LinearCombinationPostprocessor
    pp_names = 'cm3_Calcite cm3_Diopside cm3_Magnesite'
    pp_coefs = '1 1 1'
  []
[]

[Outputs]
  exodus = true
  csv = true
[]