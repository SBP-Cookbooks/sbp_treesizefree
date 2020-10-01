#
# Cookbook Name:: sbp_treesizefree
# Recipe:: default
#
# Copyright 2014, Schuberg Philis
#

unless File.exist?("#{node['treesizefree']['install_dir']}/TreeSizeFree.exe")
  zipfile = File.basename(node['treesizefree']['url'])
  temppath = "c:\\Windows\\Temp\\#{zipfile}"

  remote_file temppath do
    source node['treesizefree']['url']
    checksum node['treesizefree']['checksum']
    action :create
  end

  archive_file zipfile do
    path temppath
    destination node['treesizefree']['install_dir']
    action :extract
  end
end
