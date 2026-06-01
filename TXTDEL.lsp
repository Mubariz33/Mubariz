(defun c:TXTDEL ( / ss)

  ;; Sadece TEXT ve MTEXT nesnelerini seçtirir
  (setq ss (ssget '((0 . "TEXT,MTEXT"))))

  (if ss
    (progn
      (command "_.erase" ss "")
      (princ
        (strcat
          "\n"
          (itoa (sslength ss))
          " adet metin silindi."
        )
      )
    )
    (princ "\nSilinecek metin bulunamadı.")
  )

  (princ)
)

(PRINC " --> 'Mubariz' Cizim yardimlari yuklendi !")
(princ "\nBu yazilim Mubariz tarafindan gelistirilmistir.\n")
(princ "Mubariz'in bilgisi ve izni olmadan kullanilmasi kesinlikle yasaktir.\n")
(princ "Izinsiz kullanim tespit edilmesi durumunda yasal islemler baslatilabilir.\n")
(princ "Lutfen yetkili ve lisansli kullanim saglayiniz.\n")
(princ "\n Lispi calistirmak icin komut satirina 'TXTDEL' yaziniz ")
