Backup::Model.new(:massiveapp, 'MassiveApp Backup') do
  database MySQL do |db|
    db.name               = "massiveapp"
    db.username           = "root"
    db.password           = "root"
    db.host               = "localhost"
    db.port               = 3306
    db.socket             = "/tmp/mysql.sock"
    db.additional_options = ['--quick', '--single-transaction', '--triggers']
  end
  store_with SCP do |server|
    server.username = 'vagrant'
    server.password = 'vagrant'
    server.ip       = '33.33.13.38'
    server.port     = 22
    server.path     = '~/backups/'
    server.keep     = 5
  end
  compress_with Gzip do |compression|
    compression.best = true
    compression.fast = false
  end
  encrypt_with OpenSSL do |encryption|
    encryption.password = 'frobnicate'
  end
end