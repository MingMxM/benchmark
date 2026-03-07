# This inputs file is used to do a benchmark of CO2 mineralization

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
  [concentration]
  []
[]

[AuxVariables]
  [pressure]
  []
  [eqm_k]
    initial_condition = 0.1
  []
  [mineral_conc]
    family = MONOMIAL
    order = CONSTANT
  []
  [initial_and_reference_conc]
    initial_condition = 0
  []
  [porosity]
    family = MONOMIAL
    order = CONSTANT
  []
[]

[AuxKernels]
  [mineral_conc]
    type = PorousFlowPropertyAux
    property = mineral_concentration
    mineral_species = 0
    variable = mineral_conc
  []
  [porosity]
    type = PorousFlowPropertyAux
    property = porosity
    variable = porosity
  []
[]

[UserObjects]
  [dictator]
    type = PorousFlowDictator
    number_fluid_components = 2
    number_fluid_phases = 1
    porous_flow_vars = concentration
    number_aqueous_kinetic = 1
  []  
[]

[Kernels]
    [mass]
        type = PorousFlowMassTimeDerivative
        fluid_component = 0
        variable = concentration
    []
    [diff]
        type = PorousFlowDispersiveFlux
        disp_long = 0 
        disp_trans = 0
        variable = concentration
    []
    [precipitation_dissolution]
      type = PorousFlowPreDis
      mineral_density = 1000.0
      stoichiometry = 1
      variable = concentration
    []
[]

[ICs]
  [initial_pressure]
    type = ConstantIC
    value = 1e6
    variable = pressure
  []
  [initial_concentration]
    type = ConstantIC
    value = 1e-6
    variable = concentration
  []
[]

[BCs]
  [constant_con]
    type = DirichletBC
    boundary = inlet
    value = 0.15 
    variable = concentration
  []
[]

[FluidProperties]
  [the_simple_fluid]
    type = SimpleFluidProperties
    bulk_modulus = 2e+09
    viscosity = 0.001
    density0 = 1000
  []
[]

[Materials]
    [temperature]
        type = PorousFlowTemperature
        temperature = 283.0
    []  
    [matrix_porosity]
        type = PorousFlowPorosity
        block = Matrix
        porosity_zero = 0.3
        chemical = true
        initial_mineral_concentrations = initial_and_reference_conc
        reference_chemistry = initial_and_reference_conc
    []
    [fracture_porosity]
        type = PorousFlowPorosity
        block = Fracture
        porosity_zero = 0.7
        chemical = true
        initial_mineral_concentrations = initial_and_reference_conc
        reference_chemistry = initial_and_reference_conc
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
    [precipitation_dissolution]
      type = PorousFlowAqueousPreDisChemistry
      reference_temperature = 283.0
      activation_energy = 1
      equilibrium_constants = eqm_k
      kinetic_rate_constant = 1E-8
      molar_volume = 1
      num_reactions = 1
      primary_activity_coefficients = 1
      primary_concentrations = concentration
      reactions = 1
      specific_reactive_surface_area = 1
    []
    [mineral_concentration]
      type = PorousFlowAqueousPreDisMineral
    []
    [fs]
        type = PorousFlow1PhaseFullySaturated
        porepressure = pressure
    []
    [massfrac]
        type = PorousFlowMassFraction
        mass_fraction_vars = 'concentration'
    []
    [simple_fluid]
        type = PorousFlowSingleComponentFluid
        fp = the_simple_fluid
        phase = 0
    []
    [diffusion_coefficient]
        type = PorousFlowDiffusivityConst
        diffusion_coeff = '1e-9 1e-9'
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
  end_time = 1E6
  dt = 1E5
  nl_rel_tol = 1E-8
[]

[Outputs]
  exodus = true
[]