/*
 * Deskflow -- mouse and keyboard sharing utility
 * Copyright (C) 2012-2016 Symless Ltd.
 * Copyright (C) 2006 Chris Schoeneman
 *
 * This package is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * found in the file LICENSE that should have accompanied this file.
 *
 * This package is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

#pragma once

#include "server/ClientProxy1_2.h"

//! Proxy for client implementing protocol version 1.3
class ClientProxy1_3 : public ClientProxy1_2
{
public:
  ClientProxy1_3(const std::string &name, deskflow::IStream *adoptedStream, IEventQueue *events);
  ClientProxy1_3(ClientProxy1_3 const &) = delete;
  ClientProxy1_3(ClientProxy1_3 &&) = delete;
  ~ClientProxy1_3();

  ClientProxy1_3 &operator=(ClientProxy1_3 const &) = delete;
  ClientProxy1_3 &operator=(ClientProxy1_3 &&) = delete;

  // IClient overrides
  virtual void mouseWheel(int32_t xDelta, int32_t yDelta);

  void handleKeepAlive(const Event &, void *);

protected:
  // ClientProxy overrides
  virtual bool parseMessage(const uint8_t *code);
  virtual void resetHeartbeatRate();
  virtual void setHeartbeatRate(double rate, double alarm);
  virtual void resetHeartbeatTimer();
  virtual void addHeartbeatTimer();
  virtual void removeHeartbeatTimer();
  virtual void keepAlive();

private:
  double m_keepAliveRate;
  EventQueueTimer *m_keepAliveTimer;
  IEventQueue *m_events;
};
