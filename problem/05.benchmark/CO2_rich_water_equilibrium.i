# CO2-pure water equilibrium at 10 MPa and 100 C
# CO2 fugacity at 100 C and 100 bar is around 65 bar (phi = 0.66)
# log10(65) = 1.81

[UserObjects]
    [definition]
        type = GeochemicalModelDefinition
        database_file = "../../database/moose_geochemdb.json"
        basis_species = "H2O H+ HCO3-"
        equilibrium_gases = "CO2(g)"
    []
[]

[TimeIndependentReactionSolver]
    model_definition = definition
    geochemistry_reactor_name = reactor
    swap_out_of_basis = "HCO3-"
    swap_into_basis = "CO2(g)"
    charge_balance_species = "H+"
    constraint_species = "H2O              CO2(g)        H+"
    constraint_value = "  1.0              1.81          1E-6"
    constraint_meaning = "kg_solvent_water log10fugacity bulk_composition"
    constraint_unit = "   kg               dimensionless moles"
    temperature = 100
    # execute_console_output_on = ''
[]

[GlobalParams]
  point = '0 0 0'
  reactor = reactor
[]

[AuxVariables]
  [transported_H2O]  []
  [transported_HCO3] []
  [transported_H]    []
  [transported_mass] []
  [massfrac_H2O]     []
  [massfrac_HCO3]    []
  [massfrac_H]       []
[]

[AuxKernels]
  # Step 1: extract transported moles in original basis
  [transported_H2O_auxk]
    type = GeochemistryQuantityAux
    species = H2O
    variable = transported_H2O
    quantity = transported_moles_in_original_basis
  []
  [transported_HCO3_auxk]
    type = GeochemistryQuantityAux
    species = 'HCO3-'
    variable = transported_HCO3
    quantity = transported_moles_in_original_basis
  []
  [transported_H_auxk]
    type = GeochemistryQuantityAux
    species = 'H+'
    variable = transported_H
    quantity = transported_moles_in_original_basis
  []

  # Step 2: total mass (g) = sum of moles * molar mass
  [transported_mass_auxk]
    type = ParsedAux
    coupled_variables = 'transported_H2O transported_HCO3 transported_H'
    variable = transported_mass
    expression = 'transported_H2O*18.0152 + transported_HCO3*61.017 + transported_H*1.008'
  []

  # Step 3: mass fractions = species mass / total mass
  [massfrac_H2O_auxk]
    type = ParsedAux
    coupled_variables = 'transported_H2O transported_mass'
    variable = massfrac_H2O
    expression = 'transported_H2O*18.0152 / transported_mass'
  []
  [massfrac_HCO3_auxk]
    type = ParsedAux
    coupled_variables = 'transported_HCO3 transported_mass'
    variable = massfrac_HCO3
    expression = 'transported_HCO3*61.017 / transported_mass'
  []
  [massfrac_H_auxk]
    type = ParsedAux
    coupled_variables = 'transported_H transported_mass'
    variable = massfrac_H
    expression = 'transported_H*1.008 / transported_mass'
  []
[]

[Postprocessors]
  [pH]
    type = PointValue
    point = '0 0 0'
    variable = pH
  []
  [molal_HCO3]
    type = PointValue
    point = '0 0 0'
    variable = 'molal_HCO3-'
  []
  [molal_H]
    type = PointValue
    point = '0 0 0'
    variable = 'molal_H+'
  []
  [massfrac_H2O]
    type = PointValue
    point = '0 0 0'
    variable = massfrac_H2O
  []
  [massfrac_HCO3]
    type = PointValue
    point = '0 0 0'
    variable = massfrac_HCO3
  []
  [massfrac_H]
    type = PointValue
    point = '0 0 0'
    variable = massfrac_H
  []
[]

[Outputs]
  csv = true
[]