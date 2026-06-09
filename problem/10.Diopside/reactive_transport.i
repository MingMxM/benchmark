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
  [f_HCO3]
    initial_condition = 1.031139e-07
  []
  [f_Ca]
    initial_condition = 4.008000e-10
  []
  [f_Mg]
    initial_condition = 2.430500e-10
  []
  [f_SiO2]
    initial_condition = 6.008430e-10
  []
  [f_H]
    initial_condition = 1.662951e-09
  []
[]

[AuxVariables]
  [pressure]
    initial_condition = 1e7   # 10 MPa
  []

  [rate_H2O]
  []
  [rate_HCO3]
  []
  [rate_Ca]
  []
  [rate_Mg]
  []
  [rate_SiO2]
  []
  [rate_H]
  []
[]

[AuxKernels]
  [compute_rate_H2O]
    type = ParsedAux
    variable = rate_H2O
    expression = '-(rate_HCO3 + rate_Ca + rate_Mg + rate_SiO2 + rate_H)'
    coupled_variables = 'rate_HCO3 rate_Ca rate_Mg rate_SiO2 rate_H'
    execute_on = 'timestep_end'
  []
[]

[UserObjects]
  [dictator]
    type = PorousFlowDictator
    number_fluid_components = 6
    number_fluid_phases = 1
    porous_flow_vars = 'f_HCO3 f_Ca f_Mg f_SiO2 f_H'
  []
[]

[Kernels]
  # HCO3-
  [mass_HCO3]
    type = PorousFlowMassTimeDerivative
    fluid_component = 0
    variable = f_HCO3
    save_in = rate_HCO3
  []
  [diff_HCO3]
    type = PorousFlowDispersiveFlux
    fluid_component = 0
    disp_long = 0
    disp_trans = 0
    variable = f_HCO3
  []
  # Ca++
  [mass_Ca]
    type = PorousFlowMassTimeDerivative
    fluid_component = 1
    variable = f_Ca
    save_in = rate_Ca
  []
  [diff_Ca]
    type = PorousFlowDispersiveFlux
    fluid_component = 1
    disp_long = 0
    disp_trans = 0
    variable = f_Ca
  []
  # Mg++
  [mass_Mg]
    type = PorousFlowMassTimeDerivative
    fluid_component = 2
    variable = f_Mg
    save_in = rate_Mg
  []
  [diff_Mg]
    type = PorousFlowDispersiveFlux
    fluid_component = 2
    disp_long = 0
    disp_trans = 0
    variable = f_Mg
  []
  # SiO2(aq)
  [mass_SiO2]
    type = PorousFlowMassTimeDerivative
    fluid_component = 3
    variable = f_SiO2
    save_in = rate_SiO2
  []
  [diff_SiO2]
    type = PorousFlowDispersiveFlux
    fluid_component = 3
    disp_long = 0
    disp_trans = 0
    variable = f_SiO2
  []
  # H+
  [mass_H]
    type = PorousFlowMassTimeDerivative
    fluid_component = 4
    variable = f_H
    save_in = rate_H
  []
  [diff_H]
    type = PorousFlowDispersiveFlux
    fluid_component = 4
    disp_long = 0
    disp_trans = 0
    variable = f_H
  []
[]

[BCs]
  # CO2-rich water inlet boundary conditions
  # H+ and HCO3- are higher to represent CO2-rich water
  [inlet_HCO3]
    type = DirichletBC
    boundary = inlet
    variable = f_HCO3
    value = 0.0510       # high HCO3- for CO2-rich water
  []
  [inlet_Ca]
    type = DirichletBC
    boundary = inlet
    variable = f_Ca
    value = 0
  []
  [inlet_Mg]
    type = DirichletBC
    boundary = inlet
    variable = f_Mg
    value = 0
  []
  [inlet_SiO2]
    type = DirichletBC
    boundary = inlet
    variable = f_SiO2
    value = 0
  []
  [inlet_H]
    type = DirichletBC
    boundary = inlet
    variable = f_H
    value = 0.0008428      # high H+ for CO2-rich water (low pH)
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
    mass_fraction_vars = 'f_HCO3 f_Ca f_Mg f_SiO2 f_H'
  []
  [simple_fluid]
    type = PorousFlowSingleComponentFluid
    fp = the_simple_fluid
    phase = 0
  []
  [diffusion_coefficient]
    type = PorousFlowDiffusivityConst
    # 7.5e-9 m2/s for all 6 components (5 solutes + H2O)
    diffusion_coeff = '7.5e-8 7.5e-8 7.5e-8 7.5e-8 7.5e-8 7.5e-8'
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
  end_time = 2.4192e7    # 40 weeks in seconds

  [TimeStepper]
    type = SolutionTimeAdaptiveDT
    dt = 500
  []

  nl_rel_tol = 1e-7
[]

[Outputs]
  exodus = true
[]

[MultiApps]
  [react]
    type = TransientMultiApp
    input_files = water_geochemistry.i
    clone_master_mesh = true
    execute_on = 'timestep_end'
  []
[]
[Transfers]
  [changes_due_to_flow]
    type = MultiAppCopyTransfer
    source_variable = 'rate_H2O rate_HCO3 rate_Ca rate_Mg rate_SiO2 rate_H'
    variable = 'pf_rate_H2O pf_rate_HCO3 pf_rate_Ca pf_rate_Mg pf_rate_SiO2 pf_rate_H'
    to_multi_app = react
  []
  [massfrac_from_geochem]
    type = MultiAppCopyTransfer
    source_variable = 'massfrac_HCO3 massfrac_Ca massfrac_Mg massfrac_SiO2 massfrac_H'
    variable = 'f_HCO3 f_Ca f_Mg f_SiO2 f_H'
    from_multi_app = react
  []
[]
