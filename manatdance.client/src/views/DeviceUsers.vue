<template>
  <v-simple-table
    fixed-header
    height="800"
  >
    <template v-slot:default>
      <thead>
        <tr>
          <th class="text-center">User id</th>
          <th class="text-center">Name</th>
          <th class="text-center">Card</th>
          <th class="text-center">Group id</th>
          <th class="text-center">Password</th>
          <th class="text-center">Privilege</th>
        </tr>
      </thead>
      <tbody>
        <tr
          v-for="item in userSorted"
          :key="item.name"
        >
          <td>{{ item.uid }}</td>
          <td>{{ item.name }}</td>
          <td>{{ item.card }}</td>
          <td>{{ item.group_id }}</td>
          <td>{{ item.password }}</td>
          <td>{{ userPrivilege(item.privilege) }}</td>
        </tr>
      </tbody>
    </template>
  </v-simple-table>
</template>

<script lang="ts">
import Vue from "vue";

import { DeviceUser } from "@/types/types";

import { getDeviceUsers } from "@/axios_instances/device.api";

export default Vue.extend({
  name: "HelloWorld",
  data: () => ({
    users: [] as Array<DeviceUser>,
  }),
  created() {
    this.getDeviceUsers();
  },
  computed: {
    userSorted(): Array<DeviceUser> {
      return [...this.users].sort((a, b) => a.uid - b.uid);
    }
  },
  methods: {
    async getDeviceUsers() {
      const response = await getDeviceUsers();
      this.users = response.data as Array<DeviceUser>;
    },
    userPrivilege(priv: number): string {
        if (priv == 14) {
          return "Admin"
        }
        return "User";
    }
  },
});
</script>

