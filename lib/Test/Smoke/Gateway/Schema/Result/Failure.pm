package Test::Smoke::Gateway::Schema::Result::Failure;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

Test::Smoke::Gateway::Schema::Result::Failure

=cut

__PACKAGE__->table("failure");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  is_auto_increment: 1
  is_nullable: 0
  sequence: 'failure_id_seq'

=head2 result_id

  data_type: 'integer'
  is_foreign_key: 1
  is_nullable: 0

=head2 testname

  data_type: 'text'
  is_nullable: 0
  original: {data_type => "varchar"}

=head2 status

  data_type: 'text'
  is_nullable: 0
  original: {data_type => "varchar"}

=head2 extra

  data_type: 'text'
  is_nullable: 1
  original: {data_type => "varchar"}

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type         => "integer",
    is_auto_increment => 1,
    is_nullable       => 0,
    sequence          => "failure_id_seq",
  },
  "result_id",
  { data_type => "integer", is_foreign_key => 1, is_nullable => 0 },
  "testname",
  {
    data_type   => "text",
    is_nullable => 0,
    original    => { data_type => "varchar" },
  },
  "status",
  {
    data_type   => "text",
    is_nullable => 0,
    original    => { data_type => "varchar" },
  },
  "extra",
  {
    data_type   => "text",
    is_nullable => 1,
    original    => { data_type => "varchar" },
  },
);
__PACKAGE__->set_primary_key("id");

=head1 RELATIONS

=head2 result

Type: belongs_to

Related object: L<Test::Smoke::Gateway::Schema::Result::Result>

=cut

__PACKAGE__->belongs_to(
  "result",
  "Test::Smoke::Gateway::Schema::Result::Result",
  { id => "result_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2012-03-30 18:06:04
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:hndTlLhipWIvdJmWKiVjMA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
