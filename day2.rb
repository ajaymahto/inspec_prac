control "cis-1-2-1" do
	impact 1.0
	title "1.2.1 Verify CentOS GPG Key is Installed (Scored)"
	desc "Most packages managers implement GPG key signing to verify \
              package integrity during installation."
	describe command('rpm -q --queryformat "%{SUMMARY}\n" gpg-pubkey') do
		its('stdout') { should match /CentOS 7 Official Signing Key/ }
	end
end


control "cis-1-2-3" do
	impact 5.0
	title "1.2.3 Ensure gpgcheck is globally activated (Scored)"
	desc "The gpgcheck option, found in the main section \
	of the /etc/yum.conf and individual /etc/yum/repos.d/* \
	files determines if an RPM package's signature is checked \
 	prior to its installation."
	describe file('/etc/yum.conf') do
		its('content') { should match('gpgcheck=1') }
	end
end
