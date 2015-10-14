require_relative "code-gen"

pkg_versions = {}
apts = RunSteps.map {|s| s.apt }
`which apt-get >/dev/null && dpkg -s #{ apts.join(" ") }`.b.split("\n\n").each do |s|
  name = s[/^Package: (.*)$/, 1]
  version = s[/^Version: (.*)$/, 1]
  pkg_versions[name] = version if name && version
end

rows = [[" #", "language", "ubuntu package", "version"]]
rows += RunSteps.flat_map.with_index do |s, idx|
  (s.apt.is_a?(Array) ? s.apt : [s.apt]).map.with_index do |apt, i|
    [i == 0 ? "%3d" % (idx + 1) : "", i == 0 ? s.name : "", apt || "*N/A*", pkg_versions[apt] || '-']
  end
end

ws = rows.transpose.map {|row| row.map {|s| s.size }.max + 1 }
rows[1, 0] = [ws.map {|w| "-" * w }]
rows.each do |col|
  puts (col.zip(ws).map {|s, w| s.ljust(w) } * "|").rstrip
end
