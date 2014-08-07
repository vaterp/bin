remversion="13.0.51.0"
wget http://releases.eng.idirect.net/IDS-$remversion-latest/IDS.BUILD.NAME
wget http://releases.eng.idirect.net/IDS-$remversion-latest/pkg/evo_x5_rmt-$remversion.pkg
wget http://releases.eng.idirect.net/IDS-$remversion-latest/pkg/evo_x1_indoor_rmt-$remversion.pkg
x=`cat IDS.BUILD.NAME | cut -d'-' -f3-`

mv evo_x1_indoor_rmt-$remversion.pkg /home/nms/cfg/image_sets/evo_x1_indoor_package/evo_x1_indoor_rmt-$remversion-$x.pkg 
mv evo_x5_rmt-$remversion.pkg /home/nms/cfg/image_sets/evo_x5_remote_package/evo_x5_rmt-$remversion-$x.pkg

echo "Build Number Just Installed is:"
cat IDS.BUILD.NAME
rm IDS.BUILD.NAME 

echo cd /home/nms/cfg/image_sets
