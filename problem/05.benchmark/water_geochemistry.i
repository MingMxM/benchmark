# Serpentinized basalt geochemistry model
# Pure water + 10 MPa CO2 at 100C reacting with serpentinized basalt
# Based on Xiong et al. (2017) IJGGC Table 2 & Table 3

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

[GlobalParams]
  point = '0 0 0'
  reactor = reactor
[]

[UserObjects]
  # ── Kinetic rates: primary minerals ─────────────────────────────────────────
  # Diopside: acid + neutral
  [rate_Diopside_acid]
    type = GeochemistryKineticRate
    kinetic_species_name = Diopside
    intrinsic_rate_constant = 4.365e-7    # 10^(-6.36) mol/m2/s
    multiply_by_mass = true
    area_quantity = 0.0017                # m2/g from Table 2
    activation_energy = 96100            # 22.97 kcal/mol
    promoting_species_names = 'H+'
    promoting_indices = 0.71
  []
  [rate_Diopside_neutral]
    type = GeochemistryKineticRate
    kinetic_species_name = Diopside
    intrinsic_rate_constant = 7.762e-12   # 10^(-11.11) mol/m2/s
    multiply_by_mass = true
    area_quantity = 0.0017
    activation_energy = 40600            # 9.70 kcal/mol
  []

  # Hedenbergite: acid + neutral (same as Diopside per Table 3)
  [rate_Hedenbergite_acid]
    type = GeochemistryKineticRate
    kinetic_species_name = Hedenbergite
    intrinsic_rate_constant = 4.365e-7
    multiply_by_mass = true
    area_quantity = 0.0017
    activation_energy = 96100
    promoting_species_names = 'H+'
    promoting_indices = 0.71
  []
  [rate_Hedenbergite_neutral]
    type = GeochemistryKineticRate
    kinetic_species_name = Hedenbergite
    intrinsic_rate_constant = 7.762e-12
    multiply_by_mass = true
    area_quantity = 0.0017
    activation_energy = 40600
  []

  # Albite: acid + neutral
  [rate_Albite_acid]
    type = GeochemistryKineticRate
    kinetic_species_name = Albite
    intrinsic_rate_constant = 1.380e-9    # 10^(-8.86) mol/m2/s
    multiply_by_mass = true
    area_quantity = 0.0225
    activation_energy = 67797            # 16.2 kcal/mol
    promoting_species_names = 'H+'
    promoting_indices = 0.50
  []
  [rate_Albite_neutral]
    type = GeochemistryKineticRate
    kinetic_species_name = Albite
    intrinsic_rate_constant = 1.0e-12
    multiply_by_mass = true
    area_quantity = 0.0225
    activation_energy = 66546            # 15.9 kcal/mol
  []

  # Anorthite: acid + neutral (same as Albite per Table 3)
  [rate_Anorthite_acid]
    type = GeochemistryKineticRate
    kinetic_species_name = Anorthite
    intrinsic_rate_constant = 1.380e-9
    multiply_by_mass = true
    area_quantity = 0.0225
    activation_energy = 67797
    promoting_species_names = 'H+'
    promoting_indices = 0.50
  []
  [rate_Anorthite_neutral]
    type = GeochemistryKineticRate
    kinetic_species_name = Anorthite
    intrinsic_rate_constant = 1.0e-12
    multiply_by_mass = true
    area_quantity = 0.0225
    activation_energy = 66546
  []

  # Forsterite: acid + neutral
  [rate_Forsterite_acid]
    type = GeochemistryKineticRate
    kinetic_species_name = Forsterite
    intrinsic_rate_constant = 1.413e-7    # 10^(-6.85) mol/m2/s
    multiply_by_mass = true
    area_quantity = 0.009
    activation_energy = 67197            # 16.06 kcal/mol
    promoting_species_names = 'H+'
    promoting_indices = 0.47
  []
  [rate_Forsterite_neutral]
    type = GeochemistryKineticRate
    kinetic_species_name = Forsterite
    intrinsic_rate_constant = 2.291e-11   # 10^(-10.64) mol/m2/s
    multiply_by_mass = true
    area_quantity = 0.009
    activation_energy = 78994            # 18.88 kcal/mol
  []

  # Fayalite: acid + neutral (same as Forsterite per Table 3)
  [rate_Fayalite_acid]
    type = GeochemistryKineticRate
    kinetic_species_name = Fayalite
    intrinsic_rate_constant = 1.413e-7
    multiply_by_mass = true
    area_quantity = 0.0018
    activation_energy = 94394            # 22.56 kcal/mol
    promoting_species_names = 'H+'
    promoting_indices = 0.47
  []
  [rate_Fayalite_neutral]
    type = GeochemistryKineticRate
    kinetic_species_name = Fayalite
    intrinsic_rate_constant = 1.585e-13   # 10^(-12.8) mol/m2/s
    multiply_by_mass = true
    area_quantity = 0.0018
    activation_energy = 94394
  []

  # K-feldspar: acid + neutral
  [rate_Kfeldspar_acid]
    type = GeochemistryKineticRate
    kinetic_species_name = K-feldspar
    intrinsic_rate_constant = 3.548e-10   # 10^(-9.45) mol/m2/s
    multiply_by_mass = true
    area_quantity = 0.019
    activation_energy = 51930            # 12.41 kcal/mol
    promoting_species_names = 'H+'
    promoting_indices = 0.50
  []
  [rate_Kfeldspar_neutral]
    type = GeochemistryKineticRate
    kinetic_species_name = K-feldspar
    intrinsic_rate_constant = 3.981e-13   # 10^(-12.41) mol/m2/s
    multiply_by_mass = true
    area_quantity = 0.019
    activation_energy = 37991            # 9.08 kcal/mol
  []

  # Antigorite: acid + neutral
  [rate_Antigorite_acid]
    type = GeochemistryKineticRate
    kinetic_species_name = Antigorite
    intrinsic_rate_constant = 9.772e-11   # 10^(-10.01) mol/m2/s
    multiply_by_mass = true
    area_quantity = 0.18
    activation_energy = 70023            # 16.73 kcal/mol
    promoting_species_names = 'H+'
    promoting_indices = 0.45
  []
  [rate_Antigorite_neutral]
    type = GeochemistryKineticRate
    kinetic_species_name = Antigorite
    intrinsic_rate_constant = 8.318e-13   # 10^(-12.08) mol/m2/s
    multiply_by_mass = true
    area_quantity = 0.18
    activation_energy = 56600            # 13.53 kcal/mol
  []

  # Greenalite: acid + neutral (same as Antigorite per Table 3)
  [rate_Greenalite_acid]
    type = GeochemistryKineticRate
    kinetic_species_name = Greenalite
    intrinsic_rate_constant = 9.772e-11
    multiply_by_mass = true
    area_quantity = 0.18
    activation_energy = 70023
    promoting_species_names = 'H+'
    promoting_indices = 0.45
  []
  [rate_Greenalite_neutral]
    type = GeochemistryKineticRate
    kinetic_species_name = Greenalite
    intrinsic_rate_constant = 8.318e-13
    multiply_by_mass = true
    area_quantity = 0.18
    activation_energy = 56600
  []

  # ── Kinetic rates: secondary minerals ────────────────────────────────────────
  [rate_Calcite_acid]
    type = GeochemistryKineticRate
    kinetic_species_name = Calcite
    intrinsic_rate_constant = 0.5012      # 10^(-0.3) mol/m2/s
    multiply_by_mass = true
    area_quantity = 0.037
    activation_energy = 14394            # 3.44 kcal/mol
    promoting_species_names = 'H+'
    promoting_indices = 1.0
  []
  [rate_Calcite_neutral]
    type = GeochemistryKineticRate
    kinetic_species_name = Calcite
    intrinsic_rate_constant = 1.549e-6    # 10^(-5.81) mol/m2/s
    multiply_by_mass = true
    area_quantity = 0.037
    activation_energy = 23524            # 5.62 kcal/mol
  []

  [rate_Magnesite_acid]
    type = GeochemistryKineticRate
    kinetic_species_name = Magnesite
    intrinsic_rate_constant = 4.169e-7    # 10^(-6.38) mol/m2/s
    multiply_by_mass = true
    area_quantity = 0.0662
    activation_energy = 14394
    promoting_species_names = 'H+'
    promoting_indices = 1.0
  []
  [rate_Magnesite_neutral]
    type = GeochemistryKineticRate
    kinetic_species_name = Magnesite
    intrinsic_rate_constant = 4.571e-10   # 10^(-9.34) mol/m2/s
    multiply_by_mass = true
    area_quantity = 0.0662
    activation_energy = 23524
  []

  [rate_Siderite_acid]
    type = GeochemistryKineticRate
    kinetic_species_name = Siderite
    intrinsic_rate_constant = 1.820e-4    # 10^(-3.74) mol/m2/s
    multiply_by_mass = true
    area_quantity = 0.105
    activation_energy = 55994            # 13.38 kcal/mol
    promoting_species_names = 'H+'
    promoting_indices = 0.90
  []
  [rate_Siderite_neutral]
    type = GeochemistryKineticRate
    kinetic_species_name = Siderite
    intrinsic_rate_constant = 1.259e-9    # 10^(-8.90) mol/m2/s
    multiply_by_mass = true
    area_quantity = 0.105
    activation_energy = 62760            # 15.0 kcal/mol
  []

  [rate_Gibbsite_acid]
    type = GeochemistryKineticRate
    kinetic_species_name = Gibbsite
    intrinsic_rate_constant = 2.239e-8    # 10^(-7.65) mol/m2/s
    multiply_by_mass = true
    area_quantity = 19.0
    activation_energy = 47509            # 11.35 kcal/mol
    promoting_species_names = 'H+'
    promoting_indices = 0.992
  []
  [rate_Gibbsite_neutral]
    type = GeochemistryKineticRate
    kinetic_species_name = Gibbsite
    intrinsic_rate_constant = 3.162e-12   # 10^(-11.5) mol/m2/s
    multiply_by_mass = true
    area_quantity = 19.0
    activation_energy = 61213            # 14.63 kcal/mol
  []

  [definition]
    type = GeochemicalModelDefinition
    database_file = "../../database/moose_geochemdb.json"
    basis_species = "H2O H+ HCO3- Ca++ Mg++ Fe++ SiO2(aq) Al+++ Na+ K+"
    kinetic_minerals = "Diopside Hedenbergite Albite Anorthite Forsterite Fayalite
                        K-feldspar Antigorite Greenalite Calcite Magnesite Siderite Gibbsite"
    kinetic_rate_descriptions = "rate_Diopside_acid     rate_Diopside_neutral
                                  rate_Hedenbergite_acid  rate_Hedenbergite_neutral
                                  rate_Albite_acid        rate_Albite_neutral
                                  rate_Anorthite_acid     rate_Anorthite_neutral
                                  rate_Forsterite_acid    rate_Forsterite_neutral
                                  rate_Fayalite_acid      rate_Fayalite_neutral
                                  rate_Kfeldspar_acid     rate_Kfeldspar_neutral
                                  rate_Antigorite_acid    rate_Antigorite_neutral
                                  rate_Greenalite_acid    rate_Greenalite_neutral
                                  rate_Calcite_acid       rate_Calcite_neutral
                                  rate_Magnesite_acid     rate_Magnesite_neutral
                                  rate_Siderite_acid      rate_Siderite_neutral
                                  rate_Gibbsite_acid      rate_Gibbsite_neutral"
  []

  [nodal_void_volume_uo]
    type = NodalVoidVolume
    porosity = porosity
    execute_on = 'initial timestep_end'
  []
[]

[SpatialReactionSolver]
  model_definition = definition
  geochemistry_reactor_name = reactor
  charge_balance_species = "HCO3-"
  constraint_species = "H2O              H+            HCO3-            Ca++             Mg++             Fe++             SiO2(aq)         Al+++            Na+              K+"
  constraint_value   = "1.0              -7.0          1e-10            1e-10            1e-10            1e-10            1e-10            1e-10            1e-10            1e-10"
  constraint_meaning = "kg_solvent_water log10activity bulk_composition bulk_composition bulk_composition bulk_composition bulk_composition bulk_composition bulk_composition bulk_composition"
  constraint_unit    = "kg               dimensionless moles            moles            moles            moles            moles            moles            moles            moles"
  kinetic_species_name          = "Diopside  Hedenbergite Albite   Anorthite  Forsterite
                                   Fayalite  K-feldspar   Antigorite Greenalite
                                   Calcite   Magnesite    Siderite   Gibbsite"
  kinetic_species_initial_value = "458.73    290.59       340.65   524.45     257.03
                                   219.63    843.66       90.77    104.74
                                   1e-10     1e-10        1e-10    1e-10"
  kinetic_species_unit          = "g g g g g g g g g g g g g"
  temperature = 100
  source_species_names = 'H2O     HCO3-        Ca++       Mg++
                          Fe++    SiO2(aq)     Al+++      Na+      K+'
  source_species_rates = 'rate_H2O_per_1l  rate_HCO3_per_1l  rate_Ca_per_1l   rate_Mg_per_1l
                          rate_Fe_per_1l   rate_SiO2_per_1l  rate_Al_per_1l   rate_Na_per_1l
                          rate_K_per_1l'
  ramp_max_ionic_strength_initial = 0
  evaluate_kinetic_rates_always = true
  execute_console_output_on = ''
[]

[Executioner]
  type = Transient
  dt = 86400          # 1 day in seconds
  end_time = 8640000  # 100 days in seconds
[]

[AuxVariables]
  [porosity]
    initial_condition = 0.3   # 30% initial porosity from paper
  []
  [nodal_void_volume]  []
  # Rates from PorousFlow (kg/s)
  [pf_rate_H2O]   []
  [pf_rate_HCO3]  []
  [pf_rate_Ca]    []
  [pf_rate_Mg]    []
  [pf_rate_Fe]    []
  [pf_rate_SiO2]  []
  [pf_rate_Al]    []
  [pf_rate_Na]    []
  [pf_rate_K]     []
  # Rates per 1 litre (mol/s/L)
  [rate_H2O_per_1l]   []
  [rate_HCO3_per_1l]  []
  [rate_Ca_per_1l]    []
  [rate_Mg_per_1l]    []
  [rate_Fe_per_1l]    []
  [rate_SiO2_per_1l]  []
  [rate_Al_per_1l]    []
  [rate_Na_per_1l]    []
  [rate_K_per_1l]     []
  # Transported moles
  [transported_H2O]   []
  [transported_HCO3]  []
  [transported_Ca]    []
  [transported_Mg]    []
  [transported_Fe]    []
  [transported_SiO2]  []
  [transported_Al]    []
  [transported_Na]    []
  [transported_K]     []
  [transported_mass]  []
  # Mass fractions
  [massfrac_H2O]   []
  [massfrac_HCO3]  []
  [massfrac_Ca]    []
  [massfrac_Mg]    []
  [massfrac_Fe]    []
  [massfrac_SiO2]  []
  [massfrac_Al]    []
  [massfrac_Na]    []
  [massfrac_K]     []
[]

[AuxKernels]
  [nodal_void_volume_auxk]
    type = NodalVoidVolumeAux
    variable = nodal_void_volume
    nodal_void_volume_uo = nodal_void_volume_uo
    execute_on = 'initial timestep_end'
  []

  # ── Rates per 1 litre ──────────────────────────────────────────────────────
  [rate_H2O_per_1l_auxk]
    type = ParsedAux
    coupled_variables = 'pf_rate_H2O nodal_void_volume'
    variable = rate_H2O_per_1l
    expression = 'pf_rate_H2O / 18.0152 / nodal_void_volume'
    execute_on = 'timestep_begin'
  []
  [rate_HCO3_per_1l_auxk]
    type = ParsedAux
    coupled_variables = 'pf_rate_HCO3 nodal_void_volume'
    variable = rate_HCO3_per_1l
    expression = 'pf_rate_HCO3 / 61.017 / nodal_void_volume'
    execute_on = 'timestep_begin'
  []
  [rate_Ca_per_1l_auxk]
    type = ParsedAux
    coupled_variables = 'pf_rate_Ca nodal_void_volume'
    variable = rate_Ca_per_1l
    expression = 'pf_rate_Ca / 40.078 / nodal_void_volume'
    execute_on = 'timestep_begin'
  []
  [rate_Mg_per_1l_auxk]
    type = ParsedAux
    coupled_variables = 'pf_rate_Mg nodal_void_volume'
    variable = rate_Mg_per_1l
    expression = 'pf_rate_Mg / 24.305 / nodal_void_volume'
    execute_on = 'timestep_begin'
  []
  [rate_Fe_per_1l_auxk]
    type = ParsedAux
    coupled_variables = 'pf_rate_Fe nodal_void_volume'
    variable = rate_Fe_per_1l
    expression = 'pf_rate_Fe / 55.845 / nodal_void_volume'
    execute_on = 'timestep_begin'
  []
  [rate_SiO2_per_1l_auxk]
    type = ParsedAux
    coupled_variables = 'pf_rate_SiO2 nodal_void_volume'
    variable = rate_SiO2_per_1l
    expression = 'pf_rate_SiO2 / 60.0843 / nodal_void_volume'
    execute_on = 'timestep_begin'
  []
  [rate_Al_per_1l_auxk]
    type = ParsedAux
    coupled_variables = 'pf_rate_Al nodal_void_volume'
    variable = rate_Al_per_1l
    expression = 'pf_rate_Al / 26.982 / nodal_void_volume'
    execute_on = 'timestep_begin'
  []
  [rate_Na_per_1l_auxk]
    type = ParsedAux
    coupled_variables = 'pf_rate_Na nodal_void_volume'
    variable = rate_Na_per_1l
    expression = 'pf_rate_Na / 22.990 / nodal_void_volume'
    execute_on = 'timestep_begin'
  []
  [rate_K_per_1l_auxk]
    type = ParsedAux
    coupled_variables = 'pf_rate_K nodal_void_volume'
    variable = rate_K_per_1l
    expression = 'pf_rate_K / 39.098 / nodal_void_volume'
    execute_on = 'timestep_begin'
  []

  # ── Transported moles ──────────────────────────────────────────────────────
  [transported_H2O_auxk]
    type = GeochemistryQuantityAux
    species = H2O
    variable = transported_H2O
    quantity = transported_moles_in_original_basis
    execute_on = 'timestep_end'
  []
  [transported_HCO3_auxk]
    type = GeochemistryQuantityAux
    species = 'HCO3-'
    variable = transported_HCO3
    quantity = transported_moles_in_original_basis
    execute_on = 'timestep_end'
  []
  [transported_Ca_auxk]
    type = GeochemistryQuantityAux
    species = 'Ca++'
    variable = transported_Ca
    quantity = transported_moles_in_original_basis
    execute_on = 'timestep_end'
  []
  [transported_Mg_auxk]
    type = GeochemistryQuantityAux
    species = 'Mg++'
    variable = transported_Mg
    quantity = transported_moles_in_original_basis
    execute_on = 'timestep_end'
  []
  [transported_Fe_auxk]
    type = GeochemistryQuantityAux
    species = 'Fe++'
    variable = transported_Fe
    quantity = transported_moles_in_original_basis
    execute_on = 'timestep_end'
  []
  [transported_SiO2_auxk]
    type = GeochemistryQuantityAux
    species = 'SiO2(aq)'
    variable = transported_SiO2
    quantity = transported_moles_in_original_basis
    execute_on = 'timestep_end'
  []
  [transported_Al_auxk]
    type = GeochemistryQuantityAux
    species = 'Al+++'
    variable = transported_Al
    quantity = transported_moles_in_original_basis
    execute_on = 'timestep_end'
  []
  [transported_Na_auxk]
    type = GeochemistryQuantityAux
    species = 'Na+'
    variable = transported_Na
    quantity = transported_moles_in_original_basis
    execute_on = 'timestep_end'
  []
  [transported_K_auxk]
    type = GeochemistryQuantityAux
    species = 'K+'
    variable = transported_K
    quantity = transported_moles_in_original_basis
    execute_on = 'timestep_end'
  []

  # ── Total transported mass ─────────────────────────────────────────────────
  [transported_mass_auxk]
    type = ParsedAux
    coupled_variables = 'transported_H2O transported_HCO3 transported_Ca transported_Mg
                         transported_Fe transported_SiO2 transported_Al transported_Na
                         transported_K'
    variable = transported_mass
    expression = 'transported_H2O*18.0152 + transported_HCO3*61.017 + transported_Ca*40.078
                + transported_Mg*24.305  + transported_Fe*55.845    + transported_SiO2*60.0843
                + transported_Al*26.982  + transported_Na*22.990    + transported_K*39.098'
    execute_on = 'timestep_end'
  []

  # ── Mass fractions ─────────────────────────────────────────────────────────
  [massfrac_H2O_auxk]
    type = ParsedAux
    coupled_variables = 'transported_H2O transported_mass'
    variable = massfrac_H2O
    expression = 'transported_H2O*18.0152 / transported_mass'
    execute_on = 'timestep_end'
  []
  [massfrac_HCO3_auxk]
    type = ParsedAux
    coupled_variables = 'transported_HCO3 transported_mass'
    variable = massfrac_HCO3
    expression = 'transported_HCO3*61.017 / transported_mass'
    execute_on = 'timestep_end'
  []
  [massfrac_Ca_auxk]
    type = ParsedAux
    coupled_variables = 'transported_Ca transported_mass'
    variable = massfrac_Ca
    expression = 'transported_Ca*40.078 / transported_mass'
    execute_on = 'timestep_end'
  []
  [massfrac_Mg_auxk]
    type = ParsedAux
    coupled_variables = 'transported_Mg transported_mass'
    variable = massfrac_Mg
    expression = 'transported_Mg*24.305 / transported_mass'
    execute_on = 'timestep_end'
  []
  [massfrac_Fe_auxk]
    type = ParsedAux
    coupled_variables = 'transported_Fe transported_mass'
    variable = massfrac_Fe
    expression = 'transported_Fe*55.845 / transported_mass'
    execute_on = 'timestep_end'
  []
  [massfrac_SiO2_auxk]
    type = ParsedAux
    coupled_variables = 'transported_SiO2 transported_mass'
    variable = massfrac_SiO2
    expression = 'transported_SiO2*60.0843 / transported_mass'
    execute_on = 'timestep_end'
  []
  [massfrac_Al_auxk]
    type = ParsedAux
    coupled_variables = 'transported_Al transported_mass'
    variable = massfrac_Al
    expression = 'transported_Al*26.982 / transported_mass'
    execute_on = 'timestep_end'
  []
  [massfrac_Na_auxk]
    type = ParsedAux
    coupled_variables = 'transported_Na transported_mass'
    variable = massfrac_Na
    expression = 'transported_Na*22.990 / transported_mass'
    execute_on = 'timestep_end'
  []
  [massfrac_K_auxk]
    type = ParsedAux
    coupled_variables = 'transported_K transported_mass'
    variable = massfrac_K
    expression = 'transported_K*39.098 / transported_mass'
    execute_on = 'timestep_end'
  []
[]

[Postprocessors]
  [pH]
    type = PointValue
    variable = pH
  []
  [massfrac_H2O]
    type = PointValue
    variable = massfrac_H2O
  []
  [massfrac_HCO3]
    type = PointValue
    variable = massfrac_HCO3
  []
  [massfrac_Ca]
    type = PointValue
    variable = massfrac_Ca
  []
  [massfrac_Mg]
    type = PointValue
    variable = massfrac_Mg
  []
  [massfrac_Fe]
    type = PointValue
    variable = massfrac_Fe
  []
  [massfrac_SiO2]
    type = PointValue
    variable = massfrac_SiO2
  []
  [massfrac_Al]
    type = PointValue
    variable = massfrac_Al
  []
  [massfrac_Na]
    type = PointValue
    variable = massfrac_Na
  []
  [massfrac_K]
    type = PointValue
    variable = massfrac_K
  []
  [diopside_mg]
    type = PointValue
    variable = free_mg_Diopside
  []
  [hedenbergite_mg]
    type = PointValue
    variable = free_mg_Hedenbergite
  []
  [albite_mg]
    type = PointValue
    variable = free_mg_Albite
  []
  [anorthite_mg]
    type = PointValue
    variable = free_mg_Anorthite
  []
  [forsterite_mg]
    type = PointValue
    variable = free_mg_Forsterite
  []
  [fayalite_mg]
    type = PointValue
    variable = free_mg_Fayalite
  []
  [kfeldspar_mg]
    type = PointValue
    variable = free_mg_K-feldspar
  []
  [antigorite_mg]
    type = PointValue
    variable = free_mg_Antigorite
  []
  [greenalite_mg]
    type = PointValue
    variable = free_mg_Greenalite
  []
  [calcite_mg]
    type = PointValue
    variable = free_mg_Calcite
  []
  [magnesite_mg]
    type = PointValue
    variable = free_mg_Magnesite
  []
  [siderite_mg]
    type = PointValue
    variable = free_mg_Siderite
  []
  [gibbsite_mg]
    type = PointValue
    variable = free_mg_Gibbsite
  []
[]

[Outputs]
  exodus = true
  csv = true
[]