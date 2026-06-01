(defun c:DIMDEL ( / ss )
  (setq ss
    (ssget "_X"
      '(
        (-4 . "<OR")
          (0 . "DIMENSION")
        (-4 . "OR>")
      )
    )
  )
  (if ss
    (progn
      (command "_.erase" ss "")
      (princ
        (strcat "\n" (itoa (sslength ss)) " adet dimension silindi.")
      )
    )
    (princ "\nHicbir dimension bulunamadı.")
  )
  (princ)
)

(princ "\nDIMENSION temizleme hazır: DIMDEL")
(princ)

(PRINC " --> 'Mubariz' Cizim yardimlari yuklendi !")
(princ "\nBu yazilim Mubariz tarafindan gelistirilmistir.\n")
(princ "Mubariz'in bilgisi ve izni olmadan kullanilmasi kesinlikle yasaktir.\n")
(princ "Izinsiz kullanim tespit edilmesi durumunda yasal islemler baslatilabilir.\n")
(princ "Lutfen yetkili ve lisansli kullanim saglayiniz.\n")
(princ "\n Lispi calistirmak icin komut satirina 'DIMDEL' yaziniz ")
