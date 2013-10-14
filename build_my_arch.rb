#encoding:utf-8
=begin
	Build My Arch Linux Environment

	α改が開発環境作りなおすのがめんどくさいからっていう理由作ってる
	Arch Linuxの環境構築スクリプト
	完全俺仕様
=end
require "open-uri"

class MyArchEnv
	def initialize
		unless File.exist?("./csvs/pkgs.csv") && File.exist?("./csvs/gems.csv")
			$stderr.puts("ERROR FILE NOT FOUND!")
			exit
		end
		@pkgs=f2ary("./csvs/pkgs.csv",",")
		@gems=f2ary("./csvs/gems.csv",",")
		unless @pkgs || @gems
			$stderr.puts("File load ERROR")
			exit
		end
	end
	def f2ary(path,type)
		if File.exist?(path)
			return File.read(path).split(type)
		else
			return nil
		end
	end
	def install
		pkgstr=""
		@pkgs.each{|pkg|
			pkg.delete!("\n")
			pkgstr += " #{pkg}"
		}
		system("pacman -S #{pkgstr}")
		gemstr=""
		@gems.each{|gem|
			gem.delete!("\n")
			pkgstr += " #{gem}"
		}
		system("gem install #{gemstr}")
	end
	def write_conf
		p_cf_ph="/etc/pacman.conf"

		array=File.read(p_cf_ph).split("\n")
		i=0
		n=0
		array.each{|file|
			if file =~ /\[multilib\]/
				array[i]="[multilib]"
				n=i+1
			end
			if n!=0 && n == i
				array[i] = "Include = /etc/pacman.d/mirrorlist"
				array[i+1] = "SigLevel = Never"
				array[i+2] = ""
				array[i+3] = "[archlinuxfr]"
				array[i+4] = "SigLevel = Never"
				array[i+5] = "Server = http://repo.archlinux.fr/$arch"
			end
			i+=1
		}

		File.open(p_cf_ph,"w"){|file|
			array.each{|elem|
				file.puts(elem)
			}
		}
	end
	def set_dotfiles
		system("mv ./dotfiles/* ~/")
		system("mkdir -p ~/.vim/bundle")
		system("git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
	end
	def build_vim
		system("mkdir ~/tmp && cd ~/tmp")
		open("ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2"){|p|
			open("vim-7.4.tar.bz2","wb"){|ch|
				ch.print p.read
			}
		}
		system("tar jxf vim-7.4.tar.bz2")
		system("cd vim*/src")
		system("./configure --with-features=huge --enable-multibyte --enable-rubyinterp")
		system("make && sudo make install")

		open("http://cx4a.org/pub/rsense/rsense-0.3.tar.bz2"){|p|
			open("rsense-0.3.tar.bz2"){|ch|
				ch.print p.read
			}
		}
		system("tar jxf rsense-0.3.tar.bz2")
		system("sudo mv resense-0.3.tar.bz2 /opt")
		system("sudo chmod -R 777 /opt/rsense-0.3")
	end
	def main_all
		self.write_conf
		system("pacman -Syu")
		self.install
		system("chsh -s /usr/bin/zsh")
		self.set_dotfiles
		self.build_vim
	end
	def select_mode
		puts "
			== Please Select Mode ==
			* All Setting - all
			* Package and RubyGems Install only - pkggem
			* Set dotfile only - dotfiles
			* Build Vim only - build_vim
			* Exit - exit
		"
		print("MODE=>")
		mode=STDIN.gets.chomp
		puts ""

		case mode
			when /all/
				self.main_all
			when /pkggem/
				self.install
			when /dotfiles/
				self.set_dotfiles
			when /build_vim/
				self.build_vim
			when /exit/
				exit
		end
	end
end

MyArchEnv.new.select_mode
