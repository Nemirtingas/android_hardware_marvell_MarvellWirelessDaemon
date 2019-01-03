/*
 * Copyright (C) 2016 The CyanogenMod Project
 *               2017 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef _MARVELL_WIRELESS_DAEMON
#define _MARVELL_WIRELESS_DAEMON

void handle_thread(int clifd);
int cmd_handler(char* buffer, char *drive_card);
int wifi_enable(void);
//int uap_enable(void);
int bt_enable(void);
int fm_enable(void);
int bt_fm_enable(void);
int nfc_enable(void);


int wifi_disable(void);
int bt_disable(void);
int fm_disable(void);
int bt_fm_disable(void);
int nfc_disable(void);

int set_drv_arg(void);
int mrvl_sd8xxx_force_poweroff(void);
int get_card_type(char*);

int set_power(int on);

int wait_interface_ready (int interface_path, int us_interval, int retry);
static void kill_handler(int sig);
void get_driver_version(int);

int serv_listen (const char* name);
int serv_accept (int listenfd);

int kill_process_by_name(const char* ProcName);
int wifi_get_fwstate();

#define SOCKERR_IO          -1
#define SOCKERR_CLOSED      -2
#define SOCKERR_INVARG      -3
#define SOCKERR_TIMEOUT     -4
#define SOCKERR_OK          0
#define MAX_BUFFER_SIZE    256
#define MAX_DRV_ARG_SIZE   128


#endif
