#include "BenchmarkApp.h"
#include "Moose.h"
#include "AppFactory.h"
#include "ModulesApp.h"
#include "MooseSyntax.h"

InputParameters
BenchmarkApp::validParams()
{
  InputParameters params = MooseApp::validParams();
  params.set<bool>("use_legacy_material_output") = false;
  params.set<bool>("use_legacy_initial_residual_evaluation_behavior") = false;
  return params;
}

BenchmarkApp::BenchmarkApp(const InputParameters & parameters) : MooseApp(parameters)
{
  BenchmarkApp::registerAll(_factory, _action_factory, _syntax);
}

BenchmarkApp::~BenchmarkApp() {}

void
BenchmarkApp::registerAll(Factory & f, ActionFactory & af, Syntax & syntax)
{
  ModulesApp::registerAllObjects<BenchmarkApp>(f, af, syntax);
  Registry::registerObjectsTo(f, {"BenchmarkApp"});
  Registry::registerActionsTo(af, {"BenchmarkApp"});

  /* register custom execute flags, action syntax, etc. here */
}

void
BenchmarkApp::registerApps()
{
  registerApp(BenchmarkApp);
}

/***************************************************************************************************
 *********************** Dynamic Library Entry Points - DO NOT MODIFY ******************************
 **************************************************************************************************/
extern "C" void
BenchmarkApp__registerAll(Factory & f, ActionFactory & af, Syntax & s)
{
  BenchmarkApp::registerAll(f, af, s);
}
extern "C" void
BenchmarkApp__registerApps()
{
  BenchmarkApp::registerApps();
}
