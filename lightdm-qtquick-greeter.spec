Name:		lightdm-qtquick-greeter
	
Summary:	Lightdm Greeter based qtquick
	
Version:	0.0.0.4
	
Release:	1%{?dist}

License:	MIT
	
BuildArch:	x86_64

Requires:       qt5-qtbase,qt5-qtbase-gui,lightdm-qt5,qt5-qtquickcontrols2

BuildRequires: cmake,qt5-qtbase-devel,qt5-linguist,ninja-build,clang,lightdm-qt5-devel,qt5-qtquickcontrols2-devel
%global debug_package %{nil}
Source0: https://github.com/FascodeNet/lightdm-qtquick-greeter/archive/refs/tags/%{version}.tar.gz
%description
Lightdm Greeter based qtquick
 
	
%prep
rm -rf %{buildroot}

%setup -n lightdm-qtquick-greeter-%{version}
 
	
%build
%install
mkdir -p build
cd build
cmake -G Ninja -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++ -DCMAKE_INSTALL_PREFIX=${RPM_BUILD_ROOT} ..
ninja -j4
ninja install

%files
/usr/bin/lightdm-qtquick-greeter
/usr/share/xgreeters/lightdm-qtquick-greeter.desktop
%config /etc/lightdm/lightdm-qtquick-greeter.json

%changelog
