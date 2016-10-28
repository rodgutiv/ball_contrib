# -----------------------------------------------------------------------------
#   BALL - Biochemical ALgorithms Library
#   A C++ framework for molecular modeling and structural bioinformatics.
# -----------------------------------------------------------------------------
#
# Copyright (C) 1996-2012, the BALL Team:
#  - Andreas Hildebrandt
#  - Oliver Kohlbacher
#  - Hans-Peter Lenhof
#  - Eberhard Karls University, Tuebingen
#  - Saarland University, Saarbrücken
#  - others
#
#  This library is free software; you can redistribute it and/or
#  modify it under the terms of the GNU Lesser General Public
#  License as published by the Free Software Foundation; either
#  version 2.1 of the License, or (at your option) any later version.
#
#  This library is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#  Lesser General Public License for more details.
#
#  You should have received a copy of the GNU Lesser General Public
#  License along with this library (BALL/source/LICENSE); if not, write
#  to the Free Software Foundation, Inc., 59 Temple Place, Suite 330,
#  Boston, MA  02111-1307  USA
#
# -----------------------------------------------------------------------------
# $Maintainer: Philipp Thiel $
# $Authors: Philipp Thiel $
# -----------------------------------------------------------------------------


ExternalProject_Add(${PACKAGE}

	GIT_REPOSITORY ${CONTRIB_GITHUB_BASE}/${pkg_${PACKAGE}}
	GIT_TAG ${CONTRIB_GIT_BRANCH}
	PREFIX ${PROJECT_BINARY_DIR}
	BUILD_IN_SOURCE 1

	LOG_DOWNLOAD ${CUSTOM_LOG_DOWNLOAD}
	LOG_UPDATE ${CUSTOM_LOG_UPDATE}
	LOG_CONFIGURE ${CUSTOM_LOG_CONFIGURE}
	LOG_BUILD ${CUSTOM_LOG_BUILD}
	LOG_INSTALL ${CUSTOM_LOG_INSTALL}

	CONFIGURE_COMMAND ""
	BUILD_COMMAND ""
	INSTALL_COMMAND ""
)

# Add custom Install step
ExternalProject_Add_Step(${PACKAGE} custom_install

	LOG 1
	DEPENDEES build

	WORKING_DIRECTORY "${CONTRIB_BINARY_SRC}"
	COMMAND ${CMAKE_COMMAND} -E copy_directory ${PACKAGE}/Eigen ${CONTRIB_INSTALL_INC}/eigen3/Eigen
	COMMAND ${CMAKE_COMMAND} -E copy_directory ${PACKAGE}/unsupported/Eigen ${CONTRIB_INSTALL_INC}/eigen3/unsupported/Eigen
	COMMAND ${CMAKE_COMMAND} -E copy ${PACKAGE}/signature_of_eigen3_matrix_library ${CONTRIB_INSTALL_INC}/eigen3/signature_of_eigen3_matrix_library

	DEPENDERS install
)
