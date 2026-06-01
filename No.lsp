(defun c:No1 ()
  (setq tc_num (getint "
Birinci Numara:"))
  (if (= tc_num nil)
    (progn)
    (progn
      (setvar "errno" 0)
      (setq tc_num_uy tc_num)
      (setq tc_ent nil)
      (while (= tc_ent nil)
(initget "C")
(setq tc_ent (entsel "
Yazıyı Seç / Cıkış:"))
(if (= tc_ent nil)
  (progn
    (if (= (getvar "errno") 0)
      (progn
(setq tc_ent nil)
(setvar "errno" 0)
      )
    )
    (if (= (getvar "errno") 52)
      (progn
(setq tc_ent t)
(setvar "errno" 0)
      )
    )
  )
  (progn
    (setq tc_tan (cdr (assoc 0 (entget (car tc_ent)))))
    (if (/= tc_tan "TEXT")
      (progn
(princ "
Seçilen nesne yazı değil...")
(setq tc_ent nil)
      )
      (progn
(setq tc_stil (cdr (assoc 7 (entget (car tc_ent)))))
(setq tc_stil_yuk
       (cdr (assoc 40 (tblsearch "style" tc_stil))
       )
)
(if (= tc_stil_yuk 0.0)
  (progn
    (command "change" tc_ent "" "" "" "" "" "" tc_num_uy)
    (setq tc_num_uy (1+ tc_num_uy))
    (setq tc_ent nil)
  )
  (progn
    (command "change" tc_ent   "" ""
     ""       ""       "" tc_num_uy
    )
    (setq tc_num_uy (1+ tc_num_uy))
    (setq tc_ent nil)
  )
)
      )
    )
  )
)
      )
    )
  )
  (princ)
)
(PRINC " --> 'Mubariz' Cizim yardimlari yuklendi !")
(princ "\nBu yazilim Mubariz tarafindan gelistirilmistir.\n")
(princ "Mubariz'in bilgisi ve izni olmadan kullanilmasi kesinlikle yasaktir.\n")
(princ "Izinsiz kullanim tespit edilmesi durumunda yasal islemler baslatilabilir.\n")
(princ "Lutfen yetkili ve lisansli kullanim saglayiniz.\n")
(PRINC " Lispi calistirmak icin komut satirina 'No1' yaziniz ")