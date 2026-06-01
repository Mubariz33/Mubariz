(defun c:No4 ()
  (setq tc_num (getint "Birinci Numara:"))
  (if (= tc_num nil)
    (progn)
    (progn
      (setvar "errno" 0)
      (setq tc_num_uy tc_num)
      (setq ss (ssget '((0 . "TEXT")))) ; sadece TEXT nesnelerini seçiyoruz
      (if ss
        (progn
          (setq num_items (sslength ss)) ; Seçilen nesne sayısı
          (setq i 0) ; Döngü için sayaç
          (setq text_list '()) ; Boş bir liste başlatıyoruz

          ; Tüm TEXT nesnelerini listeye ekliyoruz
          (while (< i num_items)
            (setq tc_ent (ssname ss i)) ; i. yazı nesnesini al
            (setq tc_tan (cdr (assoc 0 (entget tc_ent)))) ; Nesne türünü al

            (if (= tc_tan "TEXT")
              (progn
                (setq tc_stil (cdr (assoc 7 (entget tc_ent)))) ; Yazı tipi stilini al
                (setq tc_stil_yuk (cdr (assoc 40 (tblsearch "style" tc_stil)))) ; Stil yüksekliği
                (setq tc_pos (cdr (assoc 10 (entget tc_ent)))) ; Yazının pozisyonunu al
                (setq tc_y (cadr tc_pos)) ; Y koordinatını al

                ; Nesneyi listeye ekle: (y koordinatı, nesne)
                (setq text_list (cons (list tc_y tc_ent) text_list))
              )
            )
            (setq i (1+ i)) ; Sayaç bir artır
          )

          ; Y koordinatına göre sıralama yap
          (setq text_list (sort text_list (lambda (a b) (> (car a) (car b)))))

          ; Sıralanmış metin nesneleri üzerinde işlem yap
          (foreach item text_list
            (setq tc_y (car item)) ; Y koordinatını al
            (setq tc_ent (cadr item)) ; Nesneyi al

            ; Yazı stilini ve yüksekliğini al
            (setq tc_stil (cdr (assoc 7 (entget tc_ent))))
            (setq tc_stil_yuk (cdr (assoc 40 (tblsearch "style" tc_stil)))) ; Stil yüksekliği

            (if (= tc_stil_yuk 0.0)
                (command "change" tc_ent "" "" "" "" "" "" tc_num_uy) ; Değeri değiştir
                (command "change" tc_ent "" "" "" "" "" "" tc_num_uy) ; Aynı şekilde uygula
            )

            (setq tc_num_uy (1+ tc_num_uy)) ; Sayıyı arttır
          )

        )
        (princ "\nHiç yazı nesnesi seçilmedi.")
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
(princ "\n Lispi calistirmak icin komut satirina 'NO4' yaziniz ")

