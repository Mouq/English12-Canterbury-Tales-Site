open my $h_file, '<', 'header.html';
open my $f_file, '<', 'footer.html';
local $/; # slurp everything
my $header = <$h_file>;
my $footer = <$f_file>;
for (glob '*.ml') {
    open my $f, '<', $_;
    substr($_, -3) = '.html';
    open my $new, '>', $_;
    print $new $header;
    print $new $_ for <$f>;
    print $new $footer;
}
