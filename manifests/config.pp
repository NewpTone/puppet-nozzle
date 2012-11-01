define nozzle::config(
  $config    = {}, 
  $content   = template("nozzle/${name}.erb"),
  $order     = undef,
  $target	 = '/etc/nozzle/nozzle.conf'
) {
  concat::fragment { "kestone-${name}":
    target  => $target,
    content => $content,
    order   => $order,
  }
}
