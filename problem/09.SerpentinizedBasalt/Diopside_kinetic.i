# Diopside (CaMgSi2O6) - kinetic dissolution at 100 C
# System: 1 kg water + 6.776 mol diopside, in contact with CO2(g) at f = 4E-3 bar
# Kinetic minerals: Diopside, Calcite, Magnesite
# Diopside dissolves; Calcite and Magnesite may precipitate as secondary phases

[UserObjects]
    [diopside_acid]
        type = GeochemistryKineticRate
        kinetic_species_name = Diopside
        intrinsic_rate_constant = 4.365e-7     # 10^-11.11 mol/m^2/s at 25 C
        activation_energy = 96.1E3             # J/mol
        area_quantity = 0.0017                 # m^2/g
        multiply_by_mass = true
        promoting_species_names = "H+"
        promoting_indices = "0.71"
        one_over_T0 = 0.003354
    []

    [calcite_acid]
        type = GeochemistryKineticRate
        kinetic_species_name = Calcite
        intrinsic_rate_constant = 0.501187     # 10^-5.81 mol/m^2/s at 25 C
        activation_energy = 14.4E3             # J/mol
        area_quantity = 0.037                  # m^2/g
        multiply_by_mass = true
        promoting_species_names = "H+"
        promoting_indices = "1.0"
        one_over_T0 = 0.003354
    []

    [magnesite_acid]
        type = GeochemistryKineticRate
        kinetic_species_name = Magnesite
        intrinsic_rate_constant = 4.1687E-7    # 10^-9.34 mol/m^2/s at 25 C
        activation_energy = 14.4E3             # J/mol
        area_quantity = 0.0662                 # m^2/g
        multiply_by_mass = true
        promoting_species_names = "H+"
        promoting_indices = "1.0"
        one_over_T0 = 0.003354
    []

    [definition]
        type = GeochemicalModelDefinition
        database_file = "../../database/moose_geochemdb.json"
        basis_species = "H2O H+ Ca++ Mg++ SiO2(aq) HCO3-"
        kinetic_minerals = "Diopside Calcite Magnesite"
        equilibrium_gases = "CO2(g)"
        kinetic_rate_descriptions = "diopside_acid calcite_acid magnesite_acid"
    []
  []

[TimeDependentReactionSolver]
    model_definition = definition
    geochemistry_reactor_name = reactor
    swap_out_of_basis = "HCO3-"
    swap_into_basis = "CO2(g)"
    charge_balance_species = "H+"
    constraint_species = "H2O              Ca++               CO2(g)        Mg++               SiO2(aq)           H+"
    constraint_value = "  1.0              1.787217e-04       72            1.792424e-04       3.589915e-04       4.213e-06"
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
[]

[AuxKernels]
  [mole_change_Diopside]
    type = ParsedAux
    coupled_variables = moles_Diopside
    expression = '4.61815697 - moles_Diopside'
    variable = mole_change_Diopside
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