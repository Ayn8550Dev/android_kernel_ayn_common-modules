/*
 *
 * FocalTech TouchScreen driver.
 *
 * Copyright (c) 2012-2020, Focaltech Ltd. All rights reserved.
 *
 * This software is licensed under the terms of the GNU General Public
 * License version 2, as published by the Free Software Foundation, and
 * may be copied, distributed, and modified under those terms.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 */

#ifndef __FF_SPI_H__
#define __FF_SPI_H__

/*****************************************************************************
* Included header files
*****************************************************************************/
#include <linux/spi/spi.h>
#include <linux/miscdevice.h>
#include "ff_log.h"
#include "ff_core.h"

/*****************************************************************************
* Private constant and macro definitions using #define
*****************************************************************************/

/*****************************************************************************
* Private enumerations, structures and unions using typedef
*****************************************************************************/
struct ff_spi_context {
    struct spi_device *spi;
    struct miscdevice mdev;
    struct mutex bus_lock;
    u8 *bus_tx_buf;
    u8 *bus_rx_buf;
    bool b_misc;
};

/*****************************************************************************
* Global variable or extern global variabls/functions
*****************************************************************************/
#ifdef CONFIG_FINGERPRINT_FOCALTECH_SPI_SUPPORT
int ff_spi_init(void);
void ff_spi_exit(void);
#endif
int ff_probe_id(void);

#endif /* __FF_SPI_H__ */
