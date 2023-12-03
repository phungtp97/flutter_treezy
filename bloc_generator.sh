#!/bin/bash

# Prompt user for module name
read -p "Enter the module name: " module_name

# Convert first character to uppercase
Module_name="$(tr '[:lower:]' '[:upper:]' <<< ${module_name:0:1})${module_name:1}"

# Create the module folder
mkdir -p lib/blocs/${module_name}

# 1. Create ${module_name}.dart
echo "export '${module_name}_bloc.dart';" > lib/blocs/${module_name}/${module_name}.dart

# 2. Create ${module_name}_bloc.dart
echo "import '../../core/base/base.dart';" >> lib/blocs/${module_name}/${module_name}_bloc.dart
echo "import '${module_name}_command.dart';" >> lib/blocs/${module_name}/${module_name}_bloc.dart
echo "import '${module_name}_state.dart';" >> lib/blocs/${module_name}/${module_name}_bloc.dart
echo "import 'package:injectable/injectable.dart';" >> lib/blocs/${module_name}/${module_name}_bloc.dart
echo "" >> lib/blocs/${module_name}/${module_name}_bloc.dart
echo "@injectable" >> lib/blocs/${module_name}/${module_name}_bloc.dart
echo "class ${Module_name}Bloc extends BaseBloc<${Module_name}State, ${Module_name}Command> {" >> lib/blocs/${module_name}/${module_name}_bloc.dart
echo "  ${Module_name}Bloc() : super(${Module_name}State());" >> lib/blocs/${module_name}/${module_name}_bloc.dart
echo "}" >> lib/blocs/${module_name}/${module_name}_bloc.dart

# 3. Create ${module_name}_state.dart
echo "import 'dart:ui';" > lib/blocs/${module_name}/${module_name}_state.dart
echo "import '../../core/base/base_state.dart';" >> lib/blocs/${module_name}/${module_name}_state.dart
echo "" >> lib/blocs/${module_name}/${module_name}_state.dart
echo "class ${Module_name}State extends BaseState {" >> lib/blocs/${module_name}/${module_name}_state.dart
echo "" >> lib/blocs/${module_name}/${module_name}_state.dart
echo "  ${Module_name}State({" >> lib/blocs/${module_name}/${module_name}_state.dart
echo "    ${Module_name}State? state," >> lib/blocs/${module_name}/${module_name}_state.dart
echo "  }) ;" >> lib/blocs/${module_name}/${module_name}_state.dart
echo "  //: locale = locale ?? state?.locale ?? const Locale('en');" >> lib/blocs/${module_name}/${module_name}_state.dart
echo "" >> lib/blocs/${module_name}/${module_name}_state.dart
echo "  @override" >> lib/blocs/${module_name}/${module_name}_state.dart
echo "  List<Object?> get props => [];" >> lib/blocs/${module_name}/${module_name}_state.dart
echo "}" >> lib/blocs/${module_name}/${module_name}_state.dart

# 4. Create ${module_name}_command.dart
echo "import '../../core/base/base.dart';" > lib/blocs/${module_name}/${module_name}_command.dart
echo "" >> lib/blocs/${module_name}/${module_name}_command.dart
echo "class ${Module_name}Command extends Command {" >> lib/blocs/${module_name}/${module_name}_command.dart
echo "}" >> lib/blocs/${module_name}/${module_name}_command.dart

# 5. Add to lib/blocs/blocs.dart
echo "export '${module_name}/${module_name}.dart';" >> lib/blocs/blocs.dart

echo "Bloc module generated successfully for ${module_name}."
