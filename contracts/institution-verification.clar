;; Institution Verification Contract
;; Validates and registers research institutions

(define-data-var admin principal tx-sender)

;; Institution data map
(define-map institutions
  { institution-id: (string-ascii 64) }
  {
    name: (string-ascii 256),
    status: (string-ascii 16),
    verification-date: uint,
    address: principal
  }
)

;; Public function to register a new institution
(define-public (register-institution (institution-id (string-ascii 64)) (name (string-ascii 256)))
  (begin
    (asserts! (is-eq tx-sender (var-get admin)) (err u1))
    (asserts! (is-none (map-get? institutions { institution-id: institution-id })) (err u2))
    (ok (map-set institutions
      { institution-id: institution-id }
      {
        name: name,
        status: "pending",
        verification-date: u0,
        address: tx-sender
      }
    ))
  )
)

;; Verify an institution
(define-public (verify-institution (institution-id (string-ascii 64)))
  (let ((institution (unwrap! (map-get? institutions { institution-id: institution-id }) (err u3))))
    (begin
      (asserts! (is-eq tx-sender (var-get admin)) (err u1))
      (ok (map-set institutions
        { institution-id: institution-id }
        (merge institution {
          status: "verified",
          verification-date: block-height
        })
      ))
    )
  )
)

;; Read-only function to check if an institution is verified
(define-read-only (is-verified (institution-id (string-ascii 64)))
  (let ((institution (map-get? institutions { institution-id: institution-id })))
    (if (is-some institution)
      (is-eq (get status (unwrap! institution false)) "verified")
      false
    )
  )
)

;; Change admin
(define-public (set-admin (new-admin principal))
  (begin
    (asserts! (is-eq tx-sender (var-get admin)) (err u1))
    (ok (var-set admin new-admin))
  )
)
