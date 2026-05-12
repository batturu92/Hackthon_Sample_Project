DECLARE
    v_order_id           NUMBER;
    v_order_status       VARCHAR2(50);
    v_total_orders       NUMBER := 0;
    v_success_count      NUMBER := 0;
    v_failed_count       NUMBER := 0;
    v_log_message        VARCHAR2(4000);

    CURSOR c_orders IS
        SELECT LEVEL AS order_id,
               CASE
                   WHEN MOD(LEVEL, 2) = 0 THEN 'OPEN'
                   ELSE 'CLOSED'
               END AS order_status
        FROM dual
        CONNECT BY LEVEL <= 300;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Order Reconciliation Started');

    FOR r IN c_orders LOOP
        BEGIN
            v_order_id := r.order_id;
            v_order_status := r.order_status;

            v_total_orders := v_total_orders + 1;

            IF v_order_status = 'OPEN' THEN
                UPDATE order_master
                   SET reconciliation_status = 'PENDING',
                       updated_date = SYSDATE
                 WHERE order_id = v_order_id;
            ELSE
                UPDATE order_master
                   SET reconciliation_status = 'COMPLETED',
                       updated_date = SYSDATE
                 WHERE order_id = v_order_id;
            END IF;

            INSERT INTO order_reconciliation_log (
                order_id,
                order_status,
                process_date
            ) VALUES (
                v_order_id,
                v_order_status,
                SYSDATE
            );

            v_success_count := v_success_count + 1;

            DBMS_OUTPUT.PUT_LINE('Processed Order: ' || v_order_id);
            DBMS_OUTPUT.PUT_LINE('Processed Order: ' || v_order_id);

end;
/