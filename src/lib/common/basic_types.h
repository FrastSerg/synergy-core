/*
 * synergy -- mouse and keyboard sharing utility
 * Copyright (C) 2012-2016 Symless Ltd.
 * Copyright (C) 2002 Chris Schoeneman
 *
 * This package is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * found in the file LICENSE that should have accompanied this file.
 *
 * This package is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#pragma once

#include "common/common.h"

#include <stdint.h>

//
// make typedefs
//
// except for SInt8 and UInt8 these types are only guaranteed to be
// at least as big as indicated (in bits).  that is, they may be
// larger than indicated.
//

// Added this because it doesn't compile on OS X 10.6 because they are already defined in Carbon
#if !defined(__MACTYPES__)
    #if defined(__APPLE__)
        #include <CoreServices/CoreServices.h>
    #else
        typedef int8_t   SInt8;
        typedef int16_t  SInt16;
        typedef int32_t  SInt32;
        typedef uint8_t  UInt8;
        typedef uint16_t UInt16;
        typedef uint32_t UInt32;
    #endif
#endif
