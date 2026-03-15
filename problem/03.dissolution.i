[TimeDependentReactionSolver]
  model_definition = definition
  geochemistry_reactor_name = reactor
  charge_balance_species = "Cl-"
  constraint_species = "H2O              H+               K+                 Al+++              SiO2(aq)           Cl-"
  constraint_value = "  1.0              1E-10            1E-10              1E-10              1E-10              5E-10"
  constraint_meaning = "kg_solvent_water bulk_composition free_concentration free_concentration free_concentration bulk_composition"
  constraint_unit = "   kg               moles            molal              molal              molal              moles"
  initial_temperature = 100
  temperature = 100
  kinetic_species_name = "K-feldspar"
  kinetic_species_initial_value = 1
  kinetic_species_unit = kg
  ramp_max_ionic_strength_initial = 0
  stoichiometric_ionic_str_using_Cl_only = true
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

[Postprocessors]
  [moles_K-feldspar]
    type = PointValue
    point = '0 0 0'
    variable = moles_K-feldspar
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
    database_file = "../database/moose_geochemdb.json"
    basis_species = "H2O H+ K+ Al+++ SiO2(aq) Cl-"
    kinetic_minerals = "K-feldspar"
    kinetic_rate_descriptions = "rate_K-feldspar"
    piecewise_linear_interpolation = true
  []
[]

[Outputs]
  csv = true
[]