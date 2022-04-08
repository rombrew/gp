/*
   Graph Plotter for numerical data analysis.
   Copyright (C) 2022 Roman Belov <romblv@gmail.com>

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef _H_DIRENT_
#define _H_DIRENT_

#ifdef _WINDOWS

#include <windows.h>

#define DIRENT_PATH_MAX			1000

typedef struct {

	wchar_t			wpath[DIRENT_PATH_MAX];

	HANDLE			hDIR;
	WIN32_FIND_DATAW	fDATA;
}
DIR;

struct dirent
{
	int		d_type;
	char		d_name[DIRENT_PATH_MAX];
};

enum {
	DT_REG		= 0,
	DT_DIR,
};

struct stat
{
	int		st_mode;
	LONGLONG	st_size;
};

DIR *opendir(const char *name);
int closedir(DIR *d);
struct dirent *readdir(DIR *d);
void rewinddir(DIR *d);
int stat(const char *file, struct stat *sb);

#else /* _WINDOWS */

#include <sys/types.h>
#include <sys/stat.h>
#include <dirent.h>

#endif

#endif /* _H_DIRENT_ */

