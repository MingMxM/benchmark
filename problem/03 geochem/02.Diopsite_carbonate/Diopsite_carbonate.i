[TimeDependentReactionSolver]
  model_definition = definition
  geochemistry_reactor_name = reactor
  swap_out_of_basis = "H+"
  swap_into_basis = "CO2(g)"
  charge_balance_species = "HCO3-"
  constraint_species = "H2O              CO2(g)        Ca++               Mg++               SiO2(aq)           HCO3-"
  constraint_value = "  1.0              100           1E-6               1E-6               1E-6               0"
  constraint_meaning = "kg_solvent_water fugacity      free_concentration free_concentration free_concentration bulk_composition"
  constraint_unit = "   kg               dimensionless molal              molal              molal              moles"
  temperature = 100
  kinetic_species_name = "Diopside Calcite Magnesite"
  kinetic_species_initial_value = "1000 0.001 0.001"
  kinetic_species_unit = "g g g"
  ramp_max_ionic_strength_initial = 0
  execute_console_output_on = ''
[]

[Functions]
  [timestepper]
    type = PiecewiseLinear
    x = '0 0.5 3'
    y = '0.01 0.05 0.1'
  []
[]

[Executioner]
  type = Transient
  [TimeStepper]
    type = FunctionDT
    function = timestepper
  []
  end_time = 100
[]

[AuxVariables]
  [mole_change_Diopside]
  []
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
  [mole_change_Diopside]
    type = PointValue
    point = '0 0 0'
    variable = "mole_change_Diopside"
  []
  [pH]
    type = PointValue
    point = '0 0 0'
    variable = 'pH'
  []
  [molal_Ca++]
    type = PointValue
    point = '0 0 0'
    variable = 'molal_Ca++'
  []
  [molal_Mg++]
    type = PointValue
    point = '0 0 0'
    variable = 'molal_Mg++'
  []
  [molal_CO3--]
    type = PointValue
    point = '0 0 0'
    variable = 'molal_CO3--'
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

[UserObjects]
  [rate_Diopside]
    type = GeochemistryKineticRate
    kinetic_species_name = Diopside
    intrinsic_rate_constant = 5.4432E-7
    multiply_by_mass = true
    area_quantity = 1000
  []
  [rate_Calcite]
    type = GeochemistryKineticRate
    kinetic_species_name = Calcite
    intrinsic_rate_constant = 5.4432E-7
    multiply_by_mass = true
    area_quantity = 1000
  []
  [rate_Magnesite]
    type = GeochemistryKineticRate
    kinetic_species_name = Magnesite
    intrinsic_rate_constant = 5.4432E-7
    multiply_by_mass = true
    area_quantity = 1000
  []
  [definition]
    type = GeochemicalModelDefinition
    database_file = "../../../database/moose_geochemdb.json"
    basis_species = "H2O H+ Ca++ Mg++ SiO2(aq) HCO3-"
    equilibrium_gases = "CO2(g)"
    kinetic_minerals = "Diopside Calcite Magnesite"
    kinetic_rate_descriptions = "rate_Diopside rate_Calcite rate_Magnesite"
    piecewise_linear_interpolation = true
  []
[]

[Outputs]
  csv = true
[]