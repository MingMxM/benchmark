# Diopside (CaMgSi2O6) - kinetic dissolution at 100 C
# System: 1 kg water + 6.776 mol diopside, in contact with CO2(g) at f = 4E-3 bar
# Kinetic minerals: Diopside, Calcite, Magnesite
# Diopside dissolves; Calcite and Magnesite may precipitate as secondary phases

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
  []

[TimeDependentReactionSolver]
    model_definition = definition
    geochemistry_reactor_name = reactor
    swap_out_of_basis = "HCO3-"
    swap_into_basis = "CO2(g)"
    charge_balance_species = "H+"
    constraint_species = "H2O              Ca++               CO2(g)        Mg++               SiO2(aq)           H+"
    constraint_value = "  1.0              1.787217e-04       81            1.792424e-04       3.589915e-04       4.213e-06"
    constraint_meaning = "kg_solvent_water free_concentration fugacity      free_concentration free_concentration bulk_composition"
    constraint_unit = "   kg               molal              dimensionless molal              molal              moles"
    initial_temperature = 100
    temperature = 100
    kinetic_species_name = '         Diopside Calcite Magnesite'
    kinetic_species_initial_value = '6.776    0.001   0.001'
    kinetic_species_unit = '         moles    moles   moles'
    ramp_max_ionic_strength_initial = 0
    evaluate_kinetic_rates_always = true # implicit time-marching used for stability
    execute_console_output_on = '' # only CSV output used in this example
[]

[GlobalParams]
  point = '0 0 0'
  reactor = reactor
[]

[Executioner]
  type = Transient
  [TimeStepper]
    type = FunctionDT
    function = 'max(10, 0.1 * t)'
  []
  end_time = 8640000        # 100 day
[]

[AuxVariables]
  [mole_change_Diopside]  []

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
  [mole_change_Diopside]
    type = ParsedAux
    coupled_variables = moles_Diopside
    expression = '4.61815697 - moles_Diopside'
    variable = mole_change_Diopside
  []
  [transported_H2O_auxk]
    type = GeochemistryQuantityAux
    variable = transported_H2O
    species = 'H2O'
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
  [transported_SiO2_auxk]
    type = GeochemistryQuantityAux
    variable = transported_SiO2
    species = 'SiO2(aq)'
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

[Postprocessors]
  [time]
      type = TimePostprocessor
  []
  [pH]
    type = PointValue
    point = '0 0 0'
    variable = pH
  []
  [mole_change_Diopside]
    type = PointValue
    point = '0 0 0'
    variable = "mole_change_Diopside"
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

  [mass_change_Calcite]
    type = PointValue
    point = '0 0 0'
    variable = free_mg_Calcite
  []
  [mass_change_Magnesite]
    type = PointValue
    point = '0 0 0'
    variable = free_mg_Magnesite
  []
  [mass_change_Diopside]
    type = PointValue
    point = '0 0 0'
    variable = free_mg_Diopside
  []
[]

[Outputs]
  csv = true
[]