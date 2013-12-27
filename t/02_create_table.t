use strict;

use Test::More;

BEGIN { use_ok 'Data::PcAxis'; }

my $px = Data::PcAxis->new('t/testData/009_klv_tau_103_en.px');

my $rows = $px->create_table(
    'rows' => ["Industry", "Serie", "Period"],
    'columns' => ["Year", "Variable"]
);

is_deeply(
    $$rows[0],
    [undef, undef, undef, "2012", "2012", "2013", "2013"]
);
is_deeply(
    $$rows[3],
    ["G Wholesale and retail trade", "Seasonally adjusted", "December", "108.7929", "100.0868", '"."', '"."']
);

$rows = $px->create_table(
    'rows' => ["Industry", "Variable", "Serie"],
    'columns' => ["Period", "Year"]
);

is_deeply(
    $$rows[0],
    [undef, undef, undef, "November", "November", "December", "December"]
);
is_deeply(
    $$rows[3],
    ["G Wholesale and retail trade", "Turnover", "Trend", "108.3487", '"."', "108.2043", '"."']
);

done_testing();

