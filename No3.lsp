(defun isNumber (s)
  (and s (wcmatch s "*[0-9]*") (not (wcmatch s "*[A-Za-z]*")))
)

(defun getPoint (e)
  (if (assoc 11 e)
    (cdr (assoc 11 e))
    (cdr (assoc 10 e))
  )
)

(defun No3_core ( / ss i ent lst start txt pt)

  ;; başlangıç numarası
  (setq start (getint "\nBaşlangıç numarası: "))
  (if (not start) (setq start 1))

  ;; seçim
  (setq ss (ssget '((0 . "TEXT,MTEXT"))))

  (if ss
    (progn
      (setq lst '())
      (setq i 0)

      ;; liste oluştur (sadece sayı olanlar)
      (repeat (sslength ss)
        (setq ent (ssname ss i))
        (setq txt (cdr (assoc 1 (entget ent))))

        (if (isNumber txt)
          (progn
            (setq pt (getPoint (entget ent)))
            (setq lst (cons (list ent pt) lst))
          )
        )

        (setq i (1+ i))
      )

      ;; sıralama (Y büyük → X küçük)
      (setq lst
        (vl-sort lst
          '(lambda (a b)
             (if (= (cadr (cadr a)) (cadr (cadr b)))
               (< (car (cadr a)) (car (cadr b))) ; soldan sağa
               (> (cadr (cadr a)) (cadr (cadr b))) ; yukarıdan aşağı
             )
          )
        )
      )

      ;; numaralandır
      (foreach item lst
        (entmod
          (subst
            (cons 1 (itoa start))
            (assoc 1 (entget (car item)))
            (entget (car item))
          )
        )
        (entupd (car item))
        (setq start (1+ start))
      )

    )
    (princ "\nSeçim yok.")
  )

  (princ)
)

;; KOMUT TANIMLARI (her sekilde calıır)
(defun c:no3 () (No3_core))
(defun c:No3 () (No3_core))
(defun c:NO3 () (No3_core))

(PRINC " --> 'Mubariz' Cizim yardimlari yuklendi !")
(princ "\nBu yazilim Mubariz tarafindan gelistirilmistir.\n")
(princ "Mubariz'in bilgisi ve izni olmadan kullanilmasi kesinlikle yasaktir.\n")
(princ "Izinsiz kullanim tespit edilmesi durumunda yasal islemler baslatilabilir.\n")
(princ "Lutfen yetkili ve lisansli kullanim saglayiniz.\n")
(princ "\nLispi calistirmak icin komut  satirina no3 / No3 / NO3 yaziniz ")
