En: You must first install modulesh and getmodulesh, you can use installer.sh in it.

Tr: ilk olarak modulesh ve getmodulesh'ı kurmalısınız bunu içinde installer.sh'ı kullanabilirsiniz.

##

En: If you are developing a module for modulesh, if it is just short for long functions, prepare two files directly as filename.sh and filename.info and compile them with the argument getmodulesh --makemodule. However, if you are building a large module and additional tools need to be downloaded for your module, prepare the install.sh file for it and prepare the requirements first, then copy the triggers to the appropriate directories.

Tr: modulesh için modul geliştiriyorsanız eğer sadece uzun fonksyonların kısaltamı ise direk olarak filename.sh ve filename.info şeklinde iki dosya hazırlayın ve bunları getmodulesh --makemodule argümanı ile derleyin. Lakin geniş kapsamlı bir modül yapıyorsanız ve modülünüz için ek araçların indirilmesi gerekiyorsa bunun için install.sh dosyası hazırlayın ve ilk olarak gereklilikleri hazırlayın ardından tetikleyicileri uygun dizinlere kopyalayın.

##

En: How to prepare a non-exhaustive module?: For this, just prepare filename.sh and filename.info, enter the necessary functions in filename.sh, also make sure that it works correctly, how are the functions in filename.sh file you prepared in filename.info and Provide information on how to use it.

Tr: geniş kapsamlı olmayan bir modül nasıl hazırlanır?: Bunun için sadece filename.sh ve filename.info hazırlayın filename.sh'ın içinde gerekli fonksyonları girin ayrıca doğru çalıştığından emin olun, filename.info nun içine hazırlamış olduğunuz filename.sh dosyasında nasıl fonksyonlar var ve nasıl kullanılır hakkında bilgiler verin.

##

En: If you are designing a complex module, please read the "module procedure with installation tool" and prepare a suitable module accordingly.

Tr: eğer karmaşık bir modül tasarlıyorsanız lütfen "kurulum araçlı modül prosedürü" nü okuyup buna uygun bir modülünüzü şekilde hazırlayın.

## 

module procedure with installation tool: First, there must be an installer file named install.sh, otherwise it will fail. The
	rules that must be followed in the install.sh file, copy your module into / usr / local / lib / modulesh. We set the permissions 
	of your module to 755. If your module uses additional files, open a directory in / usr / share / modulesh directory and use them 
	there "NOTE : Do not use this directory directly, open a subdirectory into the given directory and use it. "Also, prepare a manual
	that ends with .info to inform the users about this module and copy this file directly to / usr / share / modulesh / info directory.
	If you need additional package installation, you can have it installed in the install.sh file.

kurulum aracı ile modül prosedürü: ilk olarak install.sh isminde bir installer dosyası olmalıdır aksi taktirde başarız olacaktır. install.sh dosyasında uyulması 
	gereken kurallar vardır modülünüzü /usr/local/lib/modulesh ın içerisine kopyalayınız modülünüzün yetkilerini 755 olacak şekilde aayarlayınz
	eğer modülünüz ek dosyalar kullanıyorsa bu dosyaları /usr/share/modulesh dizininin içerisinde bir dizin açınız ve orada kullanınız 
	"NOT: direkt olarak bu dizini kullanmayın verilen dizinin içine alt dizin açıp orayı kullanın" ayriyetten birde kullanıcıları bu yaptığınız
	modul hakkında bilgilendirmek için sonu .info ile biten bir manual dosyası hazırlayınız ve bu dosyayı /usr/share/modulesh/info dizinine direkt
	olarak kopyalayınız. Bunun dışında ek paket kurulumu gerekiyorsa install.sh dosyasında bunu kurdurtabilirsiniz.
