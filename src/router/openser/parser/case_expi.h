/* 
 * $Id: case_expi.h,v 1.2 2005/06/16 11:37:54 miconda Exp $ 
 *
 * Expires Header Field Name Parsing Macros
 *
 * Copyright (C) 2001-2003 FhG Fokus
 *
 * This file is part of openser, a free SIP server.
 *
 * openser is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version
 *
 * openser is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License 
 * along with this program; if not, write to the Free Software 
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 * History:
 * ---------
 * 2003-02-28 scratchpad compatibility abandoned (jiri)
 * 2003-01-27 next baby-step to removing ZT - PRESERVE_ZT (jiri)
 */


#ifndef CASE_EXPI_H
#define CASE_EXPI_H


#define EXPI_RES_CASE                    \
        switch(LOWER_DWORD(val)) {       \
        case _res1_:                     \
		hdr->type = HDR_EXPIRES_T; \
		hdr->name.len = 7;       \
		return (p + 4);          \
                                         \
        case _res2_:                     \
		hdr->type = HDR_EXPIRES_T; \
		p += 4;                  \
		goto dc_end;             \
        }


#define expi_CASE         \
        p += 4;           \
        val = READ(p);    \
        EXPI_RES_CASE;    \
        goto other;


#endif /* CASE_EXPI_H */
