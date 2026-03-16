[TimeDependentReactionSolver]
  model_definition = definition
  geochemistry_reactor_name = reactor
  swap_out_of_basis = "H+"
  swap_into_basis = "CO2(g)"
  charge_balance_species = "Cl-"
  constraint_species = "H2O              CO2(g)        Ca++               Mg++               K+                 Na+                Fe++               Al+++              SiO2(aq)           HCO3-            Cl-"
  constraint_value = "  1.0              76.8          1E-8               1E-8               1E-8               1E-8               1E-8               1E-8               1E-8               0                1E-6"
  constraint_meaning = "kg_solvent_water fugacity      free_concentration free_concentration free_concentration free_concentration free_concentration free_concentration free_concentration bulk_composition bulk_composition"
  constraint_unit = "   kg               dimensionless molal              molal              molal              molal              molal              molal              molal              moles            moles"
  temperature = 100
  kinetic_species_name = "Diopside K-feldspar Anorthite Albite Hedenbergite Greenalite Antigorite"
  kinetic_species_initial_value = "500 500 500 500 500 500 500"
  kinetic_species_unit = "g g g g g g g"
  ramp_max_ionic_strength_initial = 10
  stoichiometric_ionic_str_using_Cl_only = true
  mol_cutoff = 1E-12
  execute_console_output_on = ''
[]

[Functions]
  [timestepper]
    type = PiecewiseLinear
    x = '0 1 3'
    y = '1e-4 3e-4 0.01'
  []
[]

[Executioner]
  type = Transient
  [TimeStepper]
    type = FunctionDT
    function = timestepper
  []
  end_time = 10
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
  [mass_change_Siderite]
    type = PointValue
    point = '0 0 0'
    variable = free_mg_Siderite
  []
  [mass_change_Diopside]
    type = PointValue
    point = '0 0 0'
    variable = free_mg_Diopside
  []
  [mass_change_K-feldspar]
    type = PointValue
    point = '0 0 0'
    variable = free_mg_K-feldspar
  []
[]

[UserObjects]
  [rate_Diopside]
    type = GeochemistryKineticRate
    kinetic_species_name = Diopside
    intrinsic_rate_constant = 5.4432E-10
    multiply_by_mass = true
    area_quantity = 1000
  []
  [rate_K-feldspar]
    type = GeochemistryKineticRate
    kinetic_species_name = K-feldspar
    intrinsic_rate_constant = 5.4432E-10
    multiply_by_mass = true
    area_quantity = 1000
  []
  [rate_Anorthite]
    type = GeochemistryKineticRate
    kinetic_species_name = Anorthite
    intrinsic_rate_constant = 5.4432E-10
    multiply_by_mass = true
    area_quantity = 1000
  []
  [rate_Albite]
    type = GeochemistryKineticRate
    kinetic_species_name = Albite
    intrinsic_rate_constant = 5.4432E-10
    multiply_by_mass = true
    area_quantity = 1000
  []
  [rate_Hedenbergite]
    type = GeochemistryKineticRate
    kinetic_species_name = Hedenbergite
    intrinsic_rate_constant = 5.4432E-10
    multiply_by_mass = true
    area_quantity = 1000
  []
  [rate_Greenalite]
    type = GeochemistryKineticRate
    kinetic_species_name = Greenalite
    intrinsic_rate_constant = 5.4432E-10
    multiply_by_mass = true
    area_quantity = 1000
  []
  [rate_Antigorite]
    type = GeochemistryKineticRate
    kinetic_species_name = Antigorite
    intrinsic_rate_constant = 5.4432E-10
    multiply_by_mass = true
    area_quantity = 1000
  []
  # [rate_Calcite]
  #   type = GeochemistryKineticRate
  #   kinetic_species_name = Calcite
  #   intrinsic_rate_constant = 5.4432E-10
  #   multiply_by_mass = true
  #   area_quantity = 1000
  # []
  # [rate_Magnesite]
  #   type = GeochemistryKineticRate
  #   kinetic_species_name = Magnesite
  #   intrinsic_rate_constant = 5.4432E-10
  #   multiply_by_mass = true
  #   area_quantity = 1000
  # []
  # [rate_Siderite]
  #   type = GeochemistryKineticRate
  #   kinetic_species_name = Siderite
  #   intrinsic_rate_constant = 5.4432E-10
  #   multiply_by_mass = true
  #   area_quantity = 1000
  # []
  [definition]
    type = GeochemicalModelDefinition
    database_file = "../../database/moose_geochemdb.json"
    basis_species = "H2O H+ Ca++ Mg++ K+ Na+ Fe++ Al+++ SiO2(aq) HCO3- Cl-"
    equilibrium_gases = "CO2(g)"
    equilibrium_minerals = "Calcite Magnesite Siderite"
    kinetic_minerals = "Diopside K-feldspar Anorthite Albite Hedenbergite Greenalite Antigorite"
    kinetic_rate_descriptions = "rate_Diopside rate_K-feldspar rate_Anorthite rate_Albite rate_Hedenbergite rate_Greenalite rate_Antigorite"
    piecewise_linear_interpolation = true
  []
[]

[Outputs]
  csv = true
[]