[UserObjects]
    [albite_acid]
        type = GeochemistryKineticRate
        kinetic_species_name = Albite
        intrinsic_rate_constant = 1.380e-9     # 10^-8.86 mol/m^2/s at 25 C
        activation_energy = 67.78E3            # J/mol
        area_quantity = 0.0225                 # m^2/g
        multiply_by_mass = true
        promoting_species_names = "H+"
        promoting_indices = "0.5"
        one_over_T0 = 0.003354
    []

    [definition]
        type = GeochemicalModelDefinition
        database_file = "../../database/moose_geochemdb.json"
        basis_species = "H2O H+ Na+ Cl- Al+++ SiO2(aq) HCO3-"
        kinetic_minerals = "Albite"
        equilibrium_gases = "CO2(g)"
        kinetic_rate_descriptions = "albite_acid"
    []
[]

[TimeDependentReactionSolver]
    model_definition = definition
    geochemistry_reactor_name = reactor
    swap_out_of_basis = "H+"
    swap_into_basis = "CO2(g)"
    charge_balance_species = "Cl-"
    constraint_species = "H2O              Na+              Cl-              CO2(g)        Al+++              SiO2(aq)           HCO3-"
    constraint_value = "  1.0              0.1              0.1              1            1E-6               3.589915e-04       1E-6"
    constraint_meaning = "kg_solvent_water bulk_composition bulk_composition fugacity      free_concentration free_concentration bulk_composition"
    constraint_unit = "   kg               moles            moles            dimensionless molal              molal              moles"
    initial_temperature = 100
    temperature = 100
    kinetic_species_name = '         Albite'
    kinetic_species_initial_value = '0.7709'
    kinetic_species_unit = '         moles'
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
    [mole_change_Albite]  []
[]

[AuxKernels]
  [mole_change_Albite]
    type = ParsedAux
    coupled_variables = moles_Albite
    expression = '0.7709 - moles_Albite'
    variable = mole_change_Albite
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
  [mole_change_Albite]
    type = PointValue
    point = '0 0 0'
    variable = "mole_change_Albite"
  []
[]

[Outputs]
  csv = true
[]