# Sample PL/SQL Anonymous Blocks for Code Review Testing

The following sections contain three large PL/SQL anonymous blocks intended for static analysis, linting, and code review agent testing.

---

# File 1: customer_processing_block.sql


DECLARE
    v_batch_id        NUMBER := 1001;
    v_customer_id     NUMBER;
    v_customer_name   VARCHAR2(200);
    v_status          VARCHAR2(50);
    v_total_amount    NUMBER := 0;
    v_counter         NUMBER := 0;
    v_error_message   VARCHAR2(4000);

    CURSOR c_customer IS
        SELECT LEVEL AS customer_id,
               'CUSTOMER_' || LEVEL AS customer_name
        FROM dual
        CONNECT BY LEVEL <= 250;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Customer Processing Started');

    FOR r IN c_customer LOOP
        BEGIN
            v_customer_id := r.customer_id;
            v_customer_name := r.customer_name;
            v_status := 'NEW';

            v_total_amount := v_total_amount + v_customer_id;
            v_counter := v_counter + 1;

            INSERT INTO customer_audit_log (
                batch_id,
                customer_id,
                customer_name,
                status,
                created_date
            ) VALUES (
                v_batch_id,
                v_customer_id,
                v_customer_name,
                v_status,
                SYSDATE
            );

            IF MOD(v_customer_id, 2) = 0 THEN
                UPDATE customer_master
                   SET customer_type = 'PREMIUM',
                       updated_date = SYSDATE
                 WHERE customer_id = v_customer_id;
            ELSE
                UPDATE customer_master
                   SET customer_type = 'STANDARD',
                       updated_date = SYSDATE
                 WHERE customer_id = v_customer_id;
            END IF;

            DBMS_OUTPUT.PUT_LINE(
                'Processed Customer ID: ' || v_customer_id ||
                ', Name: ' || v_customer_name
            );

            -- Repetitive validation section for code review testing
            IF v_customer_id > 0 THEN
                NULL;
            END IF;

            IF LENGTH(v_customer_name) > 0 THEN
                NULL;
            END IF;

            v_total_amount := v_total_amount + 10;
            v_total_amount := v_total_amount - 5;
            v_total_amount := v_total_amount + 2;
            v_total_amount := v_total_amount + 3;
            v_total_amount := v_total_amount + 4;
            v_total_amount := v_total_amount + 5;
            v_total_amount := v_total_amount + 6;
            v_total_amount := v_total_amount + 7;
            v_total_amount := v_total_amount + 8;
            v_total_amount := v_total_amount + 9;
            v_total_amount := v_total_amount + 10;
            v_total_amount := v_total_amount + 11;
            v_total_amount := v_total_amount + 12;
            v_total_amount := v_total_amount + 13;
            v_total_amount := v_total_amount + 14;
            v_total_amount := v_total_amount + 15;
            v_total_amount := v_total_amount + 16;
            v_total_amount := v_total_amount + 17;
            v_total_amount := v_total_amount + 18;
            v_total_amount := v_total_amount + 19;
            v_total_amount := v_total_amount + 20;

            DBMS_OUTPUT.PUT_LINE('Validation Completed for Customer: ' || v_customer_id);

            -- Additional repetitive logic
            FOR i IN 1 .. 50 LOOP
                v_total_amount := v_total_amount + i;
                DBMS_OUTPUT.PUT_LINE('Loop Iteration: ' || i || ' Customer: ' || v_customer_id);
            END LOOP;

        EXCEPTION
            WHEN OTHERS THEN
                v_error_message := SQLERRM;
                INSERT INTO error_log (
                    module_name,
                    error_message,
                    created_date
                ) VALUES (
                    'CUSTOMER_PROCESSING',
                    v_error_message,
                    SYSDATE
                );
        END;
    END LOOP;

    -- Large repetitive section to increase file size for testing
    DBMS_OUTPUT.PUT_LINE('Starting repetitive operations');

    -- BEGIN GENERATED SECTION
    -- 250 repetitive lines
    DBMS_OUTPUT.PUT_LINE('Generated Line 1');
    DBMS_OUTPUT.PUT_LINE('Generated Line 2');
    DBMS_OUTPUT.PUT_LINE('Generated Line 3');
    DBMS_OUTPUT.PUT_LINE('Generated Line 4');
    DBMS_OUTPUT.PUT_LINE('Generated Line 5');
    DBMS_OUTPUT.PUT_LINE('Generated Line 6');
    DBMS_OUTPUT.PUT_LINE('Generated Line 7');
    DBMS_OUTPUT.PUT_LINE('Generated Line 8');
    DBMS_OUTPUT.PUT_LINE('Generated Line 9');
    DBMS_OUTPUT.PUT_LINE('Generated Line 10');
    DBMS_OUTPUT.PUT_LINE('Generated Line 11');
    DBMS_OUTPUT.PUT_LINE('Generated Line 12');
    DBMS_OUTPUT.PUT_LINE('Generated Line 13');
    DBMS_OUTPUT.PUT_LINE('Generated Line 14');
    DBMS_OUTPUT.PUT_LINE('Generated Line 15');
    DBMS_OUTPUT.PUT_LINE('Generated Line 16');
    DBMS_OUTPUT.PUT_LINE('Generated Line 17');
    DBMS_OUTPUT.PUT_LINE('Generated Line 18');
    DBMS_OUTPUT.PUT_LINE('Generated Line 19');
    DBMS_OUTPUT.PUT_LINE('Generated Line 20');
    DBMS_OUTPUT.PUT_LINE('Generated Line 21');
    DBMS_OUTPUT.PUT_LINE('Generated Line 22');
    DBMS_OUTPUT.PUT_LINE('Generated Line 23');
    DBMS_OUTPUT.PUT_LINE('Generated Line 24');
    DBMS_OUTPUT.PUT_LINE('Generated Line 25');
    DBMS_OUTPUT.PUT_LINE('Generated Line 26');
    DBMS_OUTPUT.PUT_LINE('Generated Line 27');
    DBMS_OUTPUT.PUT_LINE('Generated Line 28');
    DBMS_OUTPUT.PUT_LINE('Generated Line 29');
    DBMS_OUTPUT.PUT_LINE('Generated Line 30');
    DBMS_OUTPUT.PUT_LINE('Generated Line 31');
    DBMS_OUTPUT.PUT_LINE('Generated Line 32');
    DBMS_OUTPUT.PUT_LINE('Generated Line 33');
    DBMS_OUTPUT.PUT_LINE('Generated Line 34');
    DBMS_OUTPUT.PUT_LINE('Generated Line 35');
    DBMS_OUTPUT.PUT_LINE('Generated Line 36');
    DBMS_OUTPUT.PUT_LINE('Generated Line 37');
    DBMS_OUTPUT.PUT_LINE('Generated Line 38');
    DBMS_OUTPUT.PUT_LINE('Generated Line 39');
    DBMS_OUTPUT.PUT_LINE('Generated Line 40');
    DBMS_OUTPUT.PUT_LINE('Generated Line 41');
    DBMS_OUTPUT.PUT_LINE('Generated Line 42');
    DBMS_OUTPUT.PUT_LINE('Generated Line 43');
    DBMS_OUTPUT.PUT_LINE('Generated Line 44');
    DBMS_OUTPUT.PUT_LINE('Generated Line 45');
    DBMS_OUTPUT.PUT_LINE('Generated Line 46');
    DBMS_OUTPUT.PUT_LINE('Generated Line 47');
    DBMS_OUTPUT.PUT_LINE('Generated Line 48');
    DBMS_OUTPUT.PUT_LINE('Generated Line 49');
    DBMS_OUTPUT.PUT_LINE('Generated Line 50');
    DBMS_OUTPUT.PUT_LINE('Generated Line 51');
    DBMS_OUTPUT.PUT_LINE('Generated Line 52');
    DBMS_OUTPUT.PUT_LINE('Generated Line 53');
    DBMS_OUTPUT.PUT_LINE('Generated Line 54');
    DBMS_OUTPUT.PUT_LINE('Generated Line 55');
    DBMS_OUTPUT.PUT_LINE('Generated Line 56');
    DBMS_OUTPUT.PUT_LINE('Generated Line 57');
    DBMS_OUTPUT.PUT_LINE('Generated Line 58');
    DBMS_OUTPUT.PUT_LINE('Generated Line 59');
    DBMS_OUTPUT.PUT_LINE('Generated Line 60');
    DBMS_OUTPUT.PUT_LINE('Generated Line 61');
    DBMS_OUTPUT.PUT_LINE('Generated Line 62');
    DBMS_OUTPUT.PUT_LINE('Generated Line 63');
    DBMS_OUTPUT.PUT_LINE('Generated Line 64');
    DBMS_OUTPUT.PUT_LINE('Generated Line 65');
    DBMS_OUTPUT.PUT_LINE('Generated Line 66');
    DBMS_OUTPUT.PUT_LINE('Generated Line 67');
    DBMS_OUTPUT.PUT_LINE('Generated Line 68');
    DBMS_OUTPUT.PUT_LINE('Generated Line 69');
    DBMS_OUTPUT.PUT_LINE('Generated Line 70');
    DBMS_OUTPUT.PUT_LINE('Generated Line 71');
    DBMS_OUTPUT.PUT_LINE('Generated Line 72');
    DBMS_OUTPUT.PUT_LINE('Generated Line 73');
    DBMS_OUTPUT.PUT_LINE('Generated Line 74');
    DBMS_OUTPUT.PUT_LINE('Generated Line 75');
    DBMS_OUTPUT.PUT_LINE('Generated Line 76');
    DBMS_OUTPUT.PUT_LINE('Generated Line 77');
    DBMS_OUTPUT.PUT_LINE('Generated Line 78');
    DBMS_OUTPUT.PUT_LINE('Generated Line 79');
    DBMS_OUTPUT.PUT_LINE('Generated Line 80');
    DBMS_OUTPUT.PUT_LINE('Generated Line 81');
    DBMS_OUTPUT.PUT_LINE('Generated Line 82');
    DBMS_OUTPUT.PUT_LINE('Generated Line 83');
    DBMS_OUTPUT.PUT_LINE('Generated Line 84');
    DBMS_OUTPUT.PUT_LINE('Generated Line 85');
    DBMS_OUTPUT.PUT_LINE('Generated Line 86');
    DBMS_OUTPUT.PUT_LINE('Generated Line 87');
    DBMS_OUTPUT.PUT_LINE('Generated Line 88');
    DBMS_OUTPUT.PUT_LINE('Generated Line 89');
    DBMS_OUTPUT.PUT_LINE('Generated Line 90');
    DBMS_OUTPUT.PUT_LINE('Generated Line 91');
    DBMS_OUTPUT.PUT_LINE('Generated Line 92');
    DBMS_OUTPUT.PUT_LINE('Generated Line 93');
    DBMS_OUTPUT.PUT_LINE('Generated Line 94');
    DBMS_OUTPUT.PUT_LINE('Generated Line 95');
    DBMS_OUTPUT.PUT_LINE('Generated Line 96');
    DBMS_OUTPUT.PUT_LINE('Generated Line 97');
    DBMS_OUTPUT.PUT_LINE('Generated Line 98');
    DBMS_OUTPUT.PUT_LINE('Generated Line 99');
    DBMS_OUTPUT.PUT_LINE('Generated Line 100');
    DBMS_OUTPUT.PUT_LINE('Generated Line 100');
    DBMS_OUTPUT.PUT_LINE('Generated Line 100');
    DBMS_OUTPUT.PUT_LINE('Generated Line 100');
    DBMS_OUTPUT.PUT_LINE('Generated Line 100');
    DBMS_OUTPUT.PUT_LINE('Generated Line 100');
    DBMS_OUTPUT.PUT_LINE('Generated Line 100');
    DBMS_OUTPUT.PUT_LINE('Generated Line 100');
    DBMS_OUTPUT.PUT_LINE('Generated Line 100');

    DBMS_OUTPUT.PUT_LINE('Generated Line 100');
    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Customer Processing Completed');
END;
/
```

---

# File 2: order_reconciliation_block.sql

```sql
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

            -- Repetitive generated content
            DBMS_OUTPUT.PUT_LINE('Audit Step 1');
            DBMS_OUTPUT.PUT_LINE('Audit Step 2');
            DBMS_OUTPUT.PUT_LINE('Audit Step 3');
            DBMS_OUTPUT.PUT_LINE('Audit Step 4');
            DBMS_OUTPUT.PUT_LINE('Audit Step 5');
            DBMS_OUTPUT.PUT_LINE('Audit Step 6');
            DBMS_OUTPUT.PUT_LINE('Audit Step 7');
            DBMS_OUTPUT.PUT_LINE('Audit Step 8');
            DBMS_OUTPUT.PUT_LINE('Audit Step 9');
            DBMS_OUTPUT.PUT_LINE('Audit Step 10');
            DBMS_OUTPUT.PUT_LINE('Audit Step 11');
            DBMS_OUTPUT.PUT_LINE('Audit Step 12');
            DBMS_OUTPUT.PUT_LINE('Audit Step 13');
            DBMS_OUTPUT.PUT_LINE('Audit Step 14');
            DBMS_OUTPUT.PUT_LINE('Audit Step 15');
            DBMS_OUTPUT.PUT_LINE('Audit Step 16');
            DBMS_OUTPUT.PUT_LINE('Audit Step 17');
            DBMS_OUTPUT.PUT_LINE('Audit Step 18');
            DBMS_OUTPUT.PUT_LINE('Audit Step 19');
            DBMS_OUTPUT.PUT_LINE('Audit Step 20');
            DBMS_OUTPUT.PUT_LINE('Audit Step 20');
            DBMS_OUTPUT.PUT_LINE('Audit Step 20');
            DBMS_OUTPUT.PUT_LINE('Audit Step 20');
            DBMS_OUTPUT.PUT_LINE('Audit Step 20');
            DBMS_OUTPUT.PUT_LINE('Audit Step 20');
            DBMS_OUTPUT.PUT_LINE('Audit Step 20');

            FOR i IN 1 .. 75 LOOP
                INSERT INTO order_temp_log (
                    order_id,
                    message,
                    created_date
                ) VALUES (
                    v_order_id,
                    'Generated Temp Message ' || i,
                    SYSDATE
                );
            END LOOP;

        EXCEPTION
            WHEN OTHERS THEN
                v_failed_count := v_failed_count + 1;
                v_log_message := SQLERRM;

                INSERT INTO reconciliation_error_log (
                    order_id,
                    error_message,
                    created_date
                ) VALUES (
                    v_order_id,
                    v_log_message,
                    SYSDATE
                );
        END;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Total Orders: ' || v_total_orders);
    DBMS_OUTPUT.PUT_LINE('Success Count: ' || v_success_count);
    DBMS_OUTPUT.PUT_LINE('Failed Count: ' || v_failed_count);

    COMMIT;
END;
/
```

---

# File 3: inventory_sync_block.sql

```sql
DECLARE
    v_item_id            NUMBER;
    v_item_name          VARCHAR2(200);
    v_sync_status        VARCHAR2(50);
    v_sync_counter       NUMBER := 0;
    v_error_text         VARCHAR2(4000);

    CURSOR c_inventory IS
        SELECT LEVEL AS item_id,
               'ITEM_' || LEVEL AS item_name
        FROM dual
        CONNECT BY LEVEL <= 350;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Inventory Synchronization Started');

    FOR r IN c_inventory LOOP
        BEGIN
            v_item_id := r.item_id;
            v_item_name := r.item_name;
            v_sync_status := 'IN_PROGRESS';

            UPDATE inventory_master
               SET sync_status = v_sync_status,
                   sync_date = SYSDATE
             WHERE item_id = v_item_id;

            INSERT INTO inventory_sync_log (
                item_id,
                item_name,
                sync_status,
                created_date
            ) VALUES (
                v_item_id,
                v_item_name,
                v_sync_status,
                SYSDATE
            );

            v_sync_counter := v_sync_counter + 1;

            -- Generated repetitive lines for review testing
            DBMS_OUTPUT.PUT_LINE('Inventory Validation 1');
            DBMS_OUTPUT.PUT_LINE('Inventory Validation 2');
            DBMS_OUTPUT.PUT_LINE('Inventory Validation 3');
            DBMS_OUTPUT.PUT_LINE('Inventory Validation 4');
            DBMS_OUTPUT.PUT_LINE('Inventory Validation 5');
            DBMS_OUTPUT.PUT_LINE('Inventory Validation 6');
            DBMS_OUTPUT.PUT_LINE('Inventory Validation 7');
            DBMS_OUTPUT.PUT_LINE('Inventory Validation 8');
            DBMS_OUTPUT.PUT_LINE('Inventory Validation 9');
            DBMS_OUTPUT.PUT_LINE('Inventory Validation 10');
            DBMS_OUTPUT.PUT_LINE('Inventory Validation 11');
            DBMS_OUTPUT.PUT_LINE('Inventory Validation 12');
            DBMS_OUTPUT.PUT_LINE('Inventory Validation 13');
            DBMS_OUTPUT.PUT_LINE('Inventory Validation 14');
            DBMS_OUTPUT.PUT_LINE('Inventory Validation 15');
            DBMS_OUTPUT.PUT_LINE('Inventory Validation 16');
            DBMS_OUTPUT.PUT_LINE('Inventory Validation 17');
            DBMS_OUTPUT.PUT_LINE('Inventory Validation 18');
            DBMS_OUTPUT.PUT_LINE('Inventory Validation 19');
            DBMS_OUTPUT.PUT_LINE('Inventory Validation 20');
            DBMS_OUTPUT.PUT_LINE('Inventory Validation 20');
            DBMS_OUTPUT.PUT_LINE('Inventory Validation 20');
            DBMS_OUTPUT.PUT_LINE('Inventory Validation 20');

            FOR j IN 1 .. 100 LOOP
                UPDATE inventory_stage
                   SET processed_flag = 'Y',
                       updated_date = SYSDATE
                 WHERE stage_id = j;
            END LOOP;

        EXCEPTION
            WHEN OTHERS THEN
                v_error_text := SQLERRM;

                INSERT INTO inventory_error_log (
                    item_id,
                    error_text,
                    created_date
                ) VALUES (
                    v_item_id,
                    v_error_text,
                    SYSDATE
                );
        END;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Inventory Synchronization Completed');
    DBMS_OUTPUT.PUT_LINE('Total Synced Records: ' || v_sync_counter);

    COMMIT;
END;
/
