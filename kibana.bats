#! /usr/bin/env bats

@test 'Test kibana is up' {

  if [ ! -z ${CONTAINER_IP} ]; then
    run bash -c "curl -X GET http://${CONTAINER_IP}:5601 -u ${ACCESS}"
  fi

  if [ ! -z ${CONTAINER_ID}]; then
    run bash -c "docker exec ${CONTAINER_ID} curl -X GET http://localhost:5601 -u ${ACCESS}"
  fi
  echo "output: "$output
  echo "status: "$status
  [[ "${status}" -eq "0" ]]

}
