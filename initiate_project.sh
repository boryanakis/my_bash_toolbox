#!/bin/bash

# INFO ------------------------------------------------------------------
cmd="\$ $(basename "$0") project_id [parent_dir] [-f] [-h/--help]"
description=$(cat <<-END
This script initiates a simple data analysis project. It generates the following directory structure under a parent_dir (user-defined) or the current directory (default):
    project_id/
    ├── data_filtered
    ├── data_raw
    ├── outputs
    ├── report_files
    ├── results
    └── scripts

END
)
usage=$(cat <<-END

${cmd}

where:
    project_id   the name for the project directory to be created. required.
    parent_dir   the full path where the project dir will be created. This directory has to exist or use '-f/--force'. default: current directory
    -f/--force   Force the creation
    -h/--help    displays the help menu and exits
END
)

# VAR ASSIGNMENT --------------------------------------------------------
PROJECT_ID="${1}"
PARENT_DIR=$(realpath -s "${2:-${PWD}}")
FORCE=${3-false}

if [[ "${FORCE}" == "false" ]]; then
  fbool=false
else
  fbool=true
fi

# VERIFY INPUTS ---------------------------------------------------------
if [[ -z "${1}" ]]; then
  echo "ERROR: project ID is required">&2
  echo "${usage}"
  exit 1;
fi

if [[ "${PROJECT_ID}" == "--help" || ${PROJECT_ID} == "-h" ]]; then
  echo "${description}"
  echo "${usage}"
  exit 1
fi

if [[ -d "${PARENT_DIR}/${PROJECT_ID}" ]]; then
  echo "ERROR: the directory you are trying to create already exists. Delete or rename the existing directory, and run this script again.">&2
  exit 1
fi


if [[ ! -d "${PARENT_DIR}" && "${fbool}" = false ]]; then
  echo "ERROR: The parent directory doesn't exist. If you wish to create the parent directory too, you can use the '-f/--force' flag"
  exit 1
elif [[ ! -d "${PARENT_DIR}" && "${fbool}" = true ]]; then
  mkdir -p "${PARENT_DIR}"
fi

mkdir -p ${PARENT_DIR}/${PROJECT_ID}/{data_raw,data_filtered,outputs,scripts,results,report_files}

echo "Project initiated: [${PARENT_DIR}/${PROJECT_ID}]"
