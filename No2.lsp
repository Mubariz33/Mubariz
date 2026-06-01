(defun C:No2 ()

(setq yazıyüksekliği (getdist (strcat "
Yazi Yuksekligini Giriniz : ")))
(setq başsayı (getdist (strcat "
Başlangıç sayısını yazınız : ")))
(setq koordinat (getpoint "
yazılacak yeri tıklayınız :"))
(setq koordinatx (car koordinat))
(setq koordinaty (cadr koordinat))
(setq koordinatxy (list koordinatx (+ (/ yazıyüksekliği 2) koordinaty) 0))
(command "text" "m" koordinatxy yazıyüksekliği "0" (fix başsayı))

(while (> 10000)
(setq başsayı (+ 1 başsayı))
(setq koordinat (getpoint "
yazılacak yeri tıklayınız :"))
(setq koordinatx (car koordinat))
(setq koordinaty (cadr koordinat))
(setq koordinatxy (list koordinatx (+ (/ yazıyüksekliği 2) koordinaty) 0))
(command "text" "m" koordinatxy yazıyüksekliği "0" (fix başsayı))
)
)
(PRINC " --> 'Mubariz' Cizim yardimlari yuklendi !")
(princ "\nBu yazilim Mubariz tarafindan gelistirilmistir.\n")
(princ "Mubariz'in bilgisi ve izni olmadan kullanilmasi kesinlikle yasaktir.\n")
(princ "Izinsiz kullanim tespit edilmesi durumunda yasal islemler baslatilabilir.\n")
(princ "Lutfen yetkili ve lisansli kullanim saglayiniz.\n")
(PRINC " Lispi calistirmak icin komut satirina 'No2' yaziniz ")