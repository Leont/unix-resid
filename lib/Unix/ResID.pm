package Unix::ResID;

use strict;
use warnings;

use XSLoader;

XSLoader::load(__PACKAGE__, __PACKAGE__->VERSION);

1;

# ABSTRACT: Set all UIDs/GIDs safely

=head2 DESCRIPTION

This module provides C<setresuid> and friends. These functions allow one to get and atomically set the user and group identifiers for the current process.

There are three types of identifiers: real (who owns the process, relevant for quotas and signalling), effective (relevant for permissions), and saved (relevant for changing the other ids).

Any user may change any of these IDs to any of the other current values. Only with appropriate administrative permissions (typically the effective user ID must be C<0>) one may change them to arbitrary values.

=func getresuid

 ($ruid, $euid, $suid) = getresuid();

This gets all user ID values for the current process.

=func setresuid

 setresuid($ruid, $euid, $suid) // die '...';

This sets the user ID values for the current process. Any value set to C<-1> will be left alone. On error, undef is returned and C<$!> will be set.

=func getresgid

 ($rgid, $egid, $sgid) = getresgid();

This gets the group id values for the current process, not including any supplemental groups.

=func setresgid

 setresgid($rgid, $egid, $sgid) // die '...';

This sets the group ID values for the current process. Any value set to C<-1> will be left alone. On error, undef is returned and C<$!> will be set.
