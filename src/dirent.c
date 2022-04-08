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

#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "dirent.h"

#ifdef _WINDOWS

DIR *opendir(const char *name)
{
	static DIR	s_dir;
	DIR		*d = &s_dir;
	HANDLE		hDIR;

	MultiByteToWideChar(CP_UTF8, 0, name, -1, d->wpath, sizeof(d->wpath));

	wcscat(d->wpath, L"/*");

	hDIR = FindFirstFileW(d->wpath, &d->fDATA);

	if (hDIR != INVALID_HANDLE_VALUE) {

		FindClose(hDIR);
	}
	else {
		return NULL;
	}

	d->hDIR = INVALID_HANDLE_VALUE;

	return d;
}

int closedir(DIR *d)
{
	if (d->hDIR != INVALID_HANDLE_VALUE) {

		FindClose(d->hDIR);
	}

	d->hDIR = INVALID_HANDLE_VALUE;

	return 0;
}

struct dirent *readdir(DIR *d)
{
	static struct dirent	s_dirent;
	struct dirent		*en = &s_dirent;
	BOOL			bR;

	if (d->hDIR != INVALID_HANDLE_VALUE) {

		bR = FindNextFileW(d->hDIR, &d->fDATA);

		if (bR == 0) {

			return NULL;
		}
	}
	else {
		d->hDIR = FindFirstFileW(d->wpath, &d->fDATA);

		if (d->hDIR == INVALID_HANDLE_VALUE) {

			return NULL;
		}
	}

	if (d->fDATA.dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) {

		en->d_type = DT_DIR;
	}
	else {
		en->d_type = DT_REG;
	}

	WideCharToMultiByte(CP_UTF8, 0, d->fDATA.cFileName, -1,
			en->d_name, sizeof(en->d_name), NULL, NULL);

	return en;
}

void rewinddir(DIR *d)
{
	closedir(d);
}

int stat(const char *file, struct stat *sb)
{
	wchar_t			wfile[DIRENT_PATH_MAX];
	LARGE_INTEGER		nSize = { 0 } ;
	HANDLE			hFile;
	BOOL			bR;

	MultiByteToWideChar(CP_UTF8, 0, file, -1, wfile, sizeof(wfile));

	hFile = CreateFileW(wfile, 0, 0, NULL, OPEN_EXISTING, 0, NULL);

	if (hFile == INVALID_HANDLE_VALUE) {

		return -1;
	}

	bR = GetFileSizeEx(hFile, &nSize);

	CloseHandle(hFile);

	if (bR == 0) {

		return -1;
	}

	sb->st_mode = 0;
	sb->st_size = nSize.QuadPart;

	return 0;
}

#endif /* _WINDOWS */

