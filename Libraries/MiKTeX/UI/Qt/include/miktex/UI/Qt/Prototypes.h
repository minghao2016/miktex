/* miktex/UI/Qt/Prototypes.h:                           -*- C++ -*-

   Copyright (C) 2008-2019 Christian Schenk

   This file is part of the MiKTeX UI Library.

   The MiKTeX UI Library is free software; you can redistribute it
   and/or modify it under the terms of the GNU General Public License
   as published by the Free Software Foundation; either version 2, or
   (at your option) any later version.

   The MiKTeX UI Library is distributed in the hope that it will be
   useful, but WITHOUT ANY WARRANTY; without even the implied warranty
   of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with the MiKTeX UI Library; if not, write to the Free
   Software Foundation, 59 Temple Place - Suite 330, Boston, MA
   02111-1307, USA. */

#pragma once

#if !defined(EBA5A7DFCC9045069C2547EAB56654CC)
#define EBA5A7DFCC9045069C2547EAB56654CC

#include <miktex/First>
#include <miktex/Definitions>

// DLL import/export switch
#if !defined(F752091EC06B4B4E827B2AACABAEE953)
#  define MIKTEXUIQTEXPORT MIKTEXDLLIMPORT
#endif

// API decoration for exported member functions
#define MIKTEXUIQTTHISAPI(type) MIKTEXUIQTEXPORT type MIKTEXTHISCALL
#define MIKTEXUIQTCEEAPI(type) MIKTEXUIQTEXPORT type MIKTEXCEECALL

#define MIKTEX_UI_QT_BEGIN_NAMESPACE            \
  namespace MiKTeX {                            \
    namespace UI {                              \
      namespace Qt {

#define MIKTEX_UI_QT_END_NAMESPACE              \
      }                                         \
    }                                           \
  }

#include <memory>
#include <string>

#include <miktex/PackageManager/PackageManager>

class QWidget;

/// @namespace MiKTeX::UI::Qt
/// @brief Qt extensions.
MIKTEX_UI_QT_BEGIN_NAMESPACE;

MIKTEXUIQTEXPORT void MIKTEXCEECALL InitializeFramework();

MIKTEXUIQTEXPORT void MIKTEXCEECALL FinalizeFramework();

MIKTEXUIQTEXPORT unsigned int MIKTEXCEECALL InstallPackageMessageBox(QWidget* parent, std::shared_ptr<MiKTeX::Packages::PackageManager> packageManager, const std::string& packageName, const std::string& trigger);

inline unsigned int InstallPackageMessageBox(std::shared_ptr<MiKTeX::Packages::PackageManager> packageManager, const std::string& packageName, const std::string& trigger)
{
  return InstallPackageMessageBox(nullptr, packageManager, packageName, trigger);
}

MIKTEXUIQTEXPORT bool MIKTEXCEECALL ProxyAuthenticationDialog(QWidget* parent);

inline bool ProxyAuthenticationDialog()
{
  return ProxyAuthenticationDialog(nullptr);
}

MIKTEX_UI_QT_END_NAMESPACE;

#endif
