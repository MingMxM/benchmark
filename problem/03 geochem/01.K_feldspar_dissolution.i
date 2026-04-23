[TimeDependentReactionSolver]
  model_definition = definition
  geochemistry_reactor_name = reactor
  swap_out_of_basis = "H+"
  swap_into_basis = "CO2(g)"
  charge_balance_species = "HCO3-"
  constraint_species = "H2O              CO2(g)        K+               Al+++              SiO2(aq)           HCO3-"
  constraint_value = "  1.0              100           0.1              1E-6               1E-6               0"
  constraint_meaning = "kg_solvent_water fugacity      bulk_composition free_concentration free_concentration bulk_composition"
  constraint_unit = "   kg               dimensionless moles            molal              molal              moles"
  temperature = 100
  kinetic_species_name = "K-feldspar"
  kinetic_species_initial_value = 1000
  kinetic_species_unit = g
  ramp_max_ionic_strength_initial = 0
  execute_console_output_on = ''
[]

[Functions]
  [timestepper]
    type = PiecewiseLinear
    x = '0    0.5  3'
    y = '0.01 0.05 0.1'
  []
[]

[Executioner]
  type = Transient
  [TimeStepper]
    type = FunctionDT
    function = timestepper
  []
  end_time = 5.0
[]

[AuxVariables]
  [moles_K_feldspar]
  []
  [mole_change_K-feldspar]
  []
[]

[AuxKernels]
  [moles_K_feldspar_aux]
    type = GeochemistryQuantityAux
    species = "K-feldspar"
    reactor = reactor
    quantity = kinetic_moles
    variable = moles_K_feldspar
  []
  [mole_change_K-feldspar]
    type = ParsedAux
    coupled_variables = moles_K_feldspar
    expression = '3.593576330 - moles_K_feldspar'
    variable = mole_change_K-feldspar
  []
[]

[Postprocessors]
  [mole_change_K-feldspar]
    type = PointValue
    point = '0 0 0'
    variable = "mole_change_K-feldspar"
  []
  [pH]
    type = PointValue
    point = '0 0 0'
    variable = 'pH'
  []
[]

[UserObjects]
  [rate_K-feldspar]
    type = GeochemistryKineticRate
    kinetic_species_name = K-feldspar
    intrinsic_rate_constant = 1.728E-10
    multiply_by_mass = true
    area_quantity = 1000
  []
  [definition]
    type = GeochemicalModelDefinition
    database_file = "../../database/moose_geochemdb.json"
    basis_species = "H2O H+ K+ Al+++ SiO2(aq) HCO3-"
    equilibrium_gases = "CO2(g)"
    kinetic_minerals = "K-feldspar"
    kinetic_rate_descriptions = "rate_K-feldspar"
    piecewise_linear_interpolation = true
  []
[]

[Outputs]
  csv = true
[]