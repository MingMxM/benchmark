# Multicomponent diffusion in fractured basalt
# CO2-rich water diffuses from inlet (left) into fracture/matrix
# 10 fluid components: H2O + HCO3- + Ca++ + Mg++ + Fe++ + SiO2(aq) + Al+++ + Na+ + K+ + H+
# 9 primary variables (N-1), H2O is implicit
# Diffusion coefficient = 7.5e-9 m2/s at 100C (Xiong et al. 2017)

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
  PorousFlowDictator = dictator
  gravity = '0 0 0'
[]

[Variables]
  [massfrac_HCO3]
    initial_condition = 1e-10
  []
  [massfrac_Ca]
    initial_condition = 1e-10
  []
  [massfrac_Mg]
    initial_condition = 1e-10
  []
  [massfrac_Fe]
    initial_condition = 1e-10
  []
  [massfrac_SiO2]
    initial_condition = 1e-10
  []
  [massfrac_Al]
    initial_condition = 1e-10
  []
  [massfrac_Na]
    initial_condition = 1e-10
  []
  [massfrac_K]
    initial_condition = 1e-10
  []
  [massfrac_H]
    initial_condition = 1e-10
  []
[]

[AuxVariables]
  [pressure]
    initial_condition = 1e7   # 10 MPa
  []
[]

[UserObjects]
  [dictator]
    type = PorousFlowDictator
    number_fluid_components = 10
    number_fluid_phases = 1
    porous_flow_vars = 'massfrac_HCO3 massfrac_Ca massfrac_Mg massfrac_Fe
                        massfrac_SiO2 massfrac_Al massfrac_Na massfrac_K massfrac_H'
  []
[]

[Kernels]
  # HCO3-
  [mass_HCO3]
    type = PorousFlowMassTimeDerivative
    fluid_component = 0
    variable = massfrac_HCO3
  []
  [diff_HCO3]
    type = PorousFlowDispersiveFlux
    fluid_component = 0
    disp_long = 0
    disp_trans = 0
    variable = massfrac_HCO3
  []
  # Ca++
  [mass_Ca]
    type = PorousFlowMassTimeDerivative
    fluid_component = 1
    variable = massfrac_Ca
  []
  [diff_Ca]
    type = PorousFlowDispersiveFlux
    fluid_component = 1
    disp_long = 0
    disp_trans = 0
    variable = massfrac_Ca
  []
  # Mg++
  [mass_Mg]
    type = PorousFlowMassTimeDerivative
    fluid_component = 2
    variable = massfrac_Mg
  []
  [diff_Mg]
    type = PorousFlowDispersiveFlux
    fluid_component = 2
    disp_long = 0
    disp_trans = 0
    variable = massfrac_Mg
  []
  # Fe++
  [mass_Fe]
    type = PorousFlowMassTimeDerivative
    fluid_component = 3
    variable = massfrac_Fe
  []
  [diff_Fe]
    type = PorousFlowDispersiveFlux
    fluid_component = 3
    disp_long = 0
    disp_trans = 0
    variable = massfrac_Fe
  []
  # SiO2(aq)
  [mass_SiO2]
    type = PorousFlowMassTimeDerivative
    fluid_component = 4
    variable = massfrac_SiO2
  []
  [diff_SiO2]
    type = PorousFlowDispersiveFlux
    fluid_component = 4
    disp_long = 0
    disp_trans = 0
    variable = massfrac_SiO2
  []
  # Al+++
  [mass_Al]
    type = PorousFlowMassTimeDerivative
    fluid_component = 5
    variable = massfrac_Al
  []
  [diff_Al]
    type = PorousFlowDispersiveFlux
    fluid_component = 5
    disp_long = 0
    disp_trans = 0
    variable = massfrac_Al
  []
  # Na+
  [mass_Na]
    type = PorousFlowMassTimeDerivative
    fluid_component = 6
    variable = massfrac_Na
  []
  [diff_Na]
    type = PorousFlowDispersiveFlux
    fluid_component = 6
    disp_long = 0
    disp_trans = 0
    variable = massfrac_Na
  []
  # K+
  [mass_K]
    type = PorousFlowMassTimeDerivative
    fluid_component = 7
    variable = massfrac_K
  []
  [diff_K]
    type = PorousFlowDispersiveFlux
    fluid_component = 7
    disp_long = 0
    disp_trans = 0
    variable = massfrac_K
  []
  # H+
  [mass_H]
    type = PorousFlowMassTimeDerivative
    fluid_component = 8
    variable = massfrac_H
  []
  [diff_H]
    type = PorousFlowDispersiveFlux
    fluid_component = 8
    disp_long = 0
    disp_trans = 0
    variable = massfrac_H
  []
[]

[BCs]
  # CO2-rich water inlet boundary conditions
  # H+ and HCO3- are higher to represent CO2-rich water
  [inlet_HCO3]
    type = DirichletBC
    boundary = inlet
    variable = massfrac_HCO3
    value = 0.01       # high HCO3- for CO2-rich water
  []
  [inlet_Ca]
    type = DirichletBC
    boundary = inlet
    variable = massfrac_Ca
    value = 1e-10
  []
  [inlet_Mg]
    type = DirichletBC
    boundary = inlet
    variable = massfrac_Mg
    value = 1e-10
  []
  [inlet_Fe]
    type = DirichletBC
    boundary = inlet
    variable = massfrac_Fe
    value = 1e-10
  []
  [inlet_SiO2]
    type = DirichletBC
    boundary = inlet
    variable = massfrac_SiO2
    value = 1e-10
  []
  [inlet_Al]
    type = DirichletBC
    boundary = inlet
    variable = massfrac_Al
    value = 1e-10
  []
  [inlet_Na]
    type = DirichletBC
    boundary = inlet
    variable = massfrac_Na
    value = 1e-10
  []
  [inlet_K]
    type = DirichletBC
    boundary = inlet
    variable = massfrac_K
    value = 1e-10
  []
  [inlet_H]
    type = DirichletBC
    boundary = inlet
    variable = massfrac_H
    value = 0.005      # high H+ for CO2-rich water (low pH)
  []
[]

[FluidProperties]
  [the_simple_fluid]
    type = SimpleFluidProperties
    bulk_modulus = 2e9
    viscosity = 0.001
    density0 = 1000
  []
[]

[Materials]
  [temperature]
    type = PorousFlowTemperature
    temperature = 373.15   # 100C in Kelvin
  []
  [matrix_porosity]
    type = PorousFlowPorosity
    block = Matrix
    porosity_zero = 0.3
  []
  [fracture_porosity]
    type = PorousFlowPorosity
    block = Fracture
    porosity_zero = 0.7
  []
  [matrix_permeability]
    type = PorousFlowPermeabilityConst
    block = Matrix
    permeability = '1e-16 0 0  0 1e-16 0  0 0 1e-16'
  []
  [fracture_permeability]
    type = PorousFlowPermeabilityConst
    block = Fracture
    permeability = '1e-14 0 0  0 1e-14 0  0 0 1e-14'
  []
  [fs]
    type = PorousFlow1PhaseFullySaturated
    porepressure = pressure
  []
  [massfrac]
    type = PorousFlowMassFraction
    mass_fraction_vars = 'massfrac_HCO3 massfrac_Ca massfrac_Mg massfrac_Fe
                          massfrac_SiO2 massfrac_Al massfrac_Na massfrac_K massfrac_H'
  []
  [simple_fluid]
    type = PorousFlowSingleComponentFluid
    fp = the_simple_fluid
    phase = 0
  []
  [diffusion_coefficient]
    type = PorousFlowDiffusivityConst
    # 7.5e-9 m2/s for all 10 components (9 solutes + H2O)
    diffusion_coeff = '7.5e-9 7.5e-9 7.5e-9 7.5e-9 7.5e-9
                       7.5e-9 7.5e-9 7.5e-9 7.5e-9 7.5e-9'
    tortuosity = 1
  []
  [relp]
    type = PorousFlowRelativePermeabilityConst
    phase = 0
  []
[]

[Preconditioning]
  active = basic
  [basic]
    type = SMP
    full = true
    petsc_options = '-ksp_diagonal_scale -ksp_diagonal_scale_fix'
    petsc_options_iname = '-pc_type -sub_pc_type -sub_pc_factor_shift_type -pc_asm_overlap'
    petsc_options_value = ' asm      lu           NONZERO                   2'
  []
  [preferred_but_might_not_be_installed]
    type = SMP
    full = true
    petsc_options_iname = '-pc_type -pc_factor_mat_solver_package'
    petsc_options_value = ' lu       mumps'
  []
[]

[Executioner]
  type = Transient
  solve_type = Newton
  end_time = 2.419e6   # ~28 days in seconds (100 days = 8.64e6)
  dt = 8.64e4          # 1 day in seconds
  nl_rel_tol = 1e-8
[]

[Outputs]
  exodus = true
[]