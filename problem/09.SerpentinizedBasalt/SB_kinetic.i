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
        intrinsic_rate_constant = 4.365e-7     # 10^-11.11 mol/m^2/s at 25 C
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
        intrinsic_rate_constant = 1.9953E-10    # 10^9.7 mol/m^2/s at 25 C
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
  []

[TimeDependentReactionSolver]
    model_definition = definition
    geochemistry_reactor_name = reactor
    swap_out_of_basis = "H+"
    swap_into_basis = "CO2(g)"
    charge_balance_species = "HCO3-"
    constraint_species = "H2O              Na+              K+               Ca++               CO2(g)        Mg++             Fe++             Al+++            SiO2(aq)         HCO3-"
    constraint_value = "  1.0              1E-4             1E-4             1E-4               72            1E-4             1E-4             1E-6             1E-04            1E-6"
    constraint_meaning = "kg_solvent_water bulk_composition bulk_composition free_concentration fugacity      bulk_composition bulk_composition bulk_composition bulk_composition bulk_composition"
    constraint_unit = "   kg               moles            moles            molal              dimensionless moles            moles            moles            moles            moles"
    initial_temperature = 100
    temperature = 100
    kinetic_species_name = '         Anorthite K-feldspar Albite Diopside Hedenbergite Greenalite Antigorite Calcite Magnesite Siderite Amrph^silica'
    kinetic_species_initial_value = '0.5013    1.2999     0.7709 1.038    0.3765       0.1898     0.009801   0.001   0.001     0.001    0.001'
    kinetic_species_unit = '         moles     moles      moles  moles    moles        moles      moles      moles   moles     moles    moles'
    ramp_max_ionic_strength_initial = 0
    evaluate_kinetic_rates_always = true # implicit time-marching used for stability
    execute_console_output_on = '' # only CSV output used in this example
[]

[GlobalParams]
  point = '0 0 0'
[]

[Executioner]
  type = Transient
  [TimeStepper]
    type = FunctionDT
    function = 'max(10, 0.1 * t)'
  []
  end_time = 8640000        # 100 day
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
  [mass_change_Siderite]
    type = PointValue
    point = '0 0 0'
    variable = free_mg_Siderite
  []
  [mass_change_Amrphsilica]
    type = PointValue
    point = '0 0 0'
    variable = 'free_mg_Amrph^silica'
  []
[]

[Outputs]
  csv = true
[]