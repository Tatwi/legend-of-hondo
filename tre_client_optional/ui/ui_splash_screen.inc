	<Page
		2.enabled='false'
		3noJTL.enabled='false'
		3withJTL.enabled='false'
		Activated='true'
		BackgroundOpacity='1.00'
		Name='Splash'
		OnDisableEffector='/effectors.opacity.slow.fadeout'
		OnEnable='opacity=1.0'
		PackSize='1,1'
		ScrollExtent='1024,768'
		Selectable='true'
		Size='1024,768'
		Visible='false'
		VisualEditLock='true'
	>
		<Data
			0='0'
			1='1'
			2='2'
			3noJTL='3noJTL'
			3withJTL='3withJTL'
			JTLJapan='JTLJapan'
			Name='CodeData'
			textVersion='textVersion'
		/>
		<Text
			Font='bold_16'
			LocalText='xxx version number here'
			Location='639,4'
			Name='textVersion'
			PackLocation='fff,nfn'
			ScrollExtent='381,34'
			Size='381,34'
			TextAlignment='Right'
			TextAlignmentVertical='Center'
		>xxx version number here</Text>
		<Page
			BackgroundOpacity='1.00'
			Enabled='false'
			Name='0'
			OnDisableEffector='/effectors.opacity.slow.fadeout'
			OnEnable='parent.1.enabled=false
parent.2.enabled=false
parent.3withJTL.enabled=false
parent.3noJTL.enabled=false'
			OnEnableEffector='/effectors.opacity.slow.fadefull'
			Opacity='0.00'
			PackLocation='nfn,nfn'
			PackSize='p,p'
			ScrollExtent='1024,768'
			Size='1024,768'
		>
			<Image
				Location='220,79'
				Name='lucas'
				PackLocation='cfc,cfc'
				PackSize='p,p'
				ScrollExtent='584,611'
				Size='584,611'
				SourceRect='0,0,512,512'
				SourceResource='ui_logo_lucas'
			/>
			<Image
				Location='686,670'
				MaximumSize='181,80'
				MinimumSize='181,80'
				Name='rating'
				PackLocation='nfn,fff'
				PackSize='f,f'
				ScrollExtent='181,80'
				Size='181,80'
				SourceRect='319,310,509,395'
				SourceResource='ui_notice'
			/>
		</Page>
		<Page
			BackgroundOpacity='1.00'
			Enabled='false'
			Name='1'
			OnDisableEffector='/effectors.opacity.slow.fadeout'
			OnEnable='parent.0.enabled=false
parent.2.enabled=false
parent.3withJTL.enabled=false
parent.3noJTL.enabled=false'
			OnEnableEffector='/effectors.opacity.slow.fadefull'
			Opacity='0.00'
			PackLocation='nfn,nfn'
			PackSize='p,p'
			ScrollExtent='1024,768'
			Size='1024,768'
		>
			<Page
				Location='102,629'
				MaximumSize='820,130'
				MinimumSize='820,130'
				Name='text'
				OnDisableEffector='/effectors.opacity.slow.fadeout'
				OnEnable='parent.0.enabled=false
parent.1.enabled=false

'
				OnEnableEffector='/effectors.opacity.slow.fadefull'
				PackLocation='cfc,fff'
				PackSize='a,a'
				ScrollExtent='820,130'
				Size='820,130'
			>
				<Text
					Font='default_14'
					LocalText='SOE and the SOE logo are registered trademarks of Sony Online Entertainment Inc.
2004 Sony Online Entertainment Inc. All Rights Reserved. All other trademarks are properties of their respective owners.'
					Location='0,78'
					MaximumSize='820,52'
					MinimumSize='820,52'
					Name='sony'
					PackLocation='nfn,fff'
					PackSize='f,f'
					ScrollExtent='820,52'
					Size='820,52'
					TextAlignment='Center'
					TextAlignmentVertical='Center'
				>SOE and the SOE logo are registered trademarks of Sony Online Entertainment Inc.
2004 Sony Online Entertainment Inc. All Rights Reserved. All other trademarks are properties of their respective owners.</Text>
				<Image
					Location='11,104'
					Name='cpyright'
					PackLocation='nfn,nfn'
					PackSize='f,f'
					ScrollExtent='15,15'
					Size='15,15'
					SourceRect='298,341,315,358'
					SourceResource='ui_rebel_final'
				/>
			</Page>
			<Text
				Font='default_20'
				LocalText='A Sony Pictures Entertainment Company'
				Location='285,479'
				Name='sonyPictures'
				PackLocation='cfc,fpf'
				PackSize='f,f'
				ScrollExtent='454,31'
				Size='454,31'
				TextAlignment='Center'
				TextAlignmentVertical='Center'
			>A Sony Pictures Entertainment Company</Text>
			<Image
				Location='224,142'
				Name='soe'
				PackLocation='cfc,cfc'
				PackSize='p,p'
				ScrollExtent='576,312'
				Size='576,312'
				SourceRect='0,44,512,328'
				SourceResource='ui_logo_soe'
			/>
		</Page>
		<Page
			BackgroundOpacity='1.00'
			Enabled='false'
			Name='2noJTL'
			OnDisableEffector='/effectors.opacity.slow.fadeout'
			OnEnable='parent.0.enabled=false
parent.1.enabled=false
parent.3withJTL.enabled=false
parent.3noJTL.enabled=false
'
			OnEnableEffector='/effectors.opacity.slow.fadefull'
			Opacity='0.00'
			PackLocation='nfn,nfn'
			PackSize='p,p'
			ScrollExtent='1024,768'
			Size='1024,768'
		>
			<Image
				Location='824,663'
				MaximumSize='187,91'
				MinimumSize='187,91'
				Name='logos'
				PackLocation='fff,fff'
				PackSize='f,f'
				ScrollExtent='187,91'
				Size='187,91'
				SourceRect='288,397,510,512'
				SourceResource='ui_notice'
			/>
			<Image
				Location='11,674'
				MaximumSize='181,80'
				MinimumSize='181,80'
				Name='rating'
				PackLocation='nfn,fff'
				PackSize='f,f'
				ScrollExtent='181,80'
				Size='181,80'
				SourceRect='319,310,509,395'
				SourceResource='ui_notice'
			/>
			<Page
				Location='212,629'
				MaximumSize='600,130'
				MinimumSize='600,130'
				Name='text'
				OnDisableEffector='/effectors.opacity.slow.fadeout'
				OnEnable='parent.0.enabled=false
parent.1.enabled=false

'
				OnEnableEffector='/effectors.opacity.slow.fadefull'
				PackLocation='cfc,fff'
				PackSize='f,f'
				ScrollExtent='600,130'
				Size='600,130'
			>
				<Text
					Font='default_14'
					LocalText='LucasArts, the LucasArts logo, STAR WARS and related properties are trademarks in the United States
and/or in other countries of Lucasfilm Ltd. and/or its affiliates.
Star Wars Galaxies is a trademark of Lucasfilm Entertainment Company Ltd.
© 2004 Lucasfilm Entertainment Company Ltd. or Lucasfilm Ltd.
All rights reserved.

SOE and the SOE logo are registered trademarks of Sony Online Entertainment Inc. in the US and/or other countries.
'
					Name='lucas'
					PackLocation='nfn,nfn'
					PackSize='f,f'
					ScrollExtent='600,140'
					Size='600,130'
					TextAlignment='Center'
					TextAlignmentVertical='Center'
				>LucasArts, the LucasArts logo, STAR WARS and related properties are trademarks in the United States
and/or in other countries of Lucasfilm Ltd. and/or its affiliates.
Star Wars Galaxies is a trademark of Lucasfilm Entertainment Company Ltd.
© 2004 Lucasfilm Entertainment Company Ltd. or Lucasfilm Ltd.
All rights reserved.

SOE and the SOE logo are registered trademarks of Sony Online Entertainment Inc. in the US and/or other countries.
</Text>
			</Page>
			<Image
				BackgroundOpacity='1.00'
				Location='217,9'
				Name='swg'
				PackLocation='cpc,cpc'
				PackSize='f,f'
				ScrollExtent='570,570'
				Size='570,570'
				SourceRect='0,0,512,512'
				SourceResource='ui_starwars_logo'
				Style='splash'
			/>
		</Page>
		<Page
			BackgroundOpacity='1.00'
			Enabled='false'
			Name='2withJTL'
			OnDisableEffector='/effectors.opacity.slow.fadeout'
			OnEnable='parent.0.enabled=false
parent.1.enabled=false
parent.2.enabled=false
parent.3noJTL.enabled=false'
			OnEnableEffector='/effectors.opacity.slow.fadefull'
			Opacity='0.00'
			PackLocation='nfn,nfn'
			PackSize='p,p'
			ScrollExtent='1024,768'
			Size='1024,768'
		>
			<Page
				Location='212,629'
				MaximumSize='600,130'
				MinimumSize='600,130'
				Name='text'
				OnDisableEffector='/effectors.opacity.slow.fadeout'
				OnEnable='parent.0.enabled=false
parent.1.enabled=false

'
				OnEnableEffector='/effectors.opacity.slow.fadefull'
				PackLocation='cfc,fff'
				PackSize='f,f'
				ScrollExtent='600,130'
				Size='600,130'
			>
				<Text
					Font='default_14'
					LocalText='SOE and the SOE logo are registered trademarks of Sony Online Entertainment Inc.'
					Location='0,108'
					Name='sony'
					PackLocation='nfn,fff'
					PackSize='f,f'
					ScrollExtent='529,22'
					Size='529,22'
					TextAlignment='Center'
					TextAlignmentVertical='Center'
					Visible='false'
				>SOE and the SOE logo are registered trademarks of Sony Online Entertainment Inc.</Text>
				<Image
					Location='203,56'
					Name='registered'
					PackLocation='nfn,nfn'
					PackSize='f,f'
					ScrollExtent='15,15'
					Size='15,15'
					SourceRect='298,320,315,338'
					SourceResource='ui_rebel_final'
					Visible='false'
				/>
				<Image
					Location='51,41'
					Name='cpyright'
					PackLocation='nfn,nfn'
					PackSize='f,f'
					ScrollExtent='15,15'
					Size='15,15'
					SourceRect='298,341,315,358'
					SourceResource='ui_rebel_final'
					Visible='false'
				/>
				<Text
					Font='default_14'
					LocalText='LucasArts, the LucasArts logo, STAR WARS and related properties are trademarks in the United States
and/or in other countries of Lucasfilm Ltd. and/or its affiliates.
Star Wars Galaxies is a trademark of Lucasfilm Entertainment Company Ltd.
© 2004 Lucasfilm Entertainment Company Ltd. or Lucasfilm Ltd.
All rights reserved.

SOE and the SOE logo are registered trademarks of Sony Online Entertainment Inc. in the US and/or other countries.
'
					Name='lucas'
					PackLocation='nfn,nfn'
					PackSize='f,f'
					ScrollExtent='600,140'
					Size='600,130'
					TextAlignment='Center'
					TextAlignmentVertical='Center'
				>Powered by SWGEmu.
GNU AFFERO GENERAL PUBLIC LICENSE

Legend of Hondo is not endorsed or supported by SWGEmu.
</Text>
			</Page>
			<Image
				BackgroundOpacity='1.00'
				Location='227,48'
				Name='swgJTL'
				PackLocation='cpc,cpc'
				PackSize='f,f'
				ScrollExtent='570,570'
				Size='570,570'
				SourceRect='0,0,512,512'
				SourceResource='ui_swgemu_logo'
				Style='splash'
			/>
		</Page>
		<Page
			BackgroundOpacity='1.00'
			Enabled='false'
			Name='JTLJapan'
			OnDisableEffector='/effectors.opacity.slow.fadeout'
			OnEnable='parent.0.enabled=false
parent.1.enabled=false
parent.2.enabled=false
parent.3noJTL.enabled=false'
			OnEnableEffector='/effectors.opacity.slow.fadefull'
			Opacity='0.00'
			PackLocation='nfn,nfn'
			PackSize='p,p'
			ScrollExtent='1024,768'
			Size='1024,768'
		>
			<Image
				Location='824,663'
				MaximumSize='187,91'
				MinimumSize='187,91'
				Name='logos'
				PackLocation='fff,fff'
				PackSize='f,f'
				ScrollExtent='187,91'
				Size='187,91'
				SourceRect='288,397,510,512'
				SourceResource='ui_notice'
			/>
			<Page
				Location='212,629'
				MaximumSize='600,130'
				MinimumSize='600,130'
				Name='text'
				OnDisableEffector='/effectors.opacity.slow.fadeout'
				OnEnable='parent.0.enabled=false
parent.1.enabled=false

'
				OnEnableEffector='/effectors.opacity.slow.fadefull'
				PackLocation='cfc,fff'
				PackSize='f,f'
				ScrollExtent='600,130'
				Size='600,130'
			>
				<Image
					Location='349,66'
					Name='registered'
					PackLocation='nfn,nfn'
					PackSize='f,f'
					ScrollExtent='15,15'
					Size='15,15'
					SourceRect='298,320,315,338'
					SourceResource='ui_rebel_final'
					Visible='false'
				/>
				<Image
					Location='135,53'
					Name='cpyright'
					PackLocation='nfn,nfn'
					PackSize='f,f'
					ScrollExtent='15,15'
					Size='15,15'
					SourceRect='298,341,315,358'
					SourceResource='ui_rebel_final'
					Visible='false'
				/>
				<Text
					Font='bold_12'
					LocalText='LucasArts, the LucasArts logo, STAR WARS and related properties are trademarks in the United States
and/or in other countries of Lucasfilm Ltd. and/or its affiliates.
Star Wars Galaxies is a trademark of Lucasfilm Entertainment Company Ltd.
© 2004 Lucasfilm Entertainment Company Ltd. or Lucasfilm Ltd.
All rights reserved.

SOE and the SOE logo are registered trademarks of Sony Online Entertainment Inc. in the US and/or other countries.
'
					Name='lucas'
					PackLocation='nfn,nfn'
					PackSize='f,f'
					ScrollExtent='600,130'
					Size='600,130'
					TextAlignment='Center'
					TextAlignmentVertical='Center'
				>LucasArts, the LucasArts logo, STAR WARS and related properties are trademarks in the United States
and/or in other countries of Lucasfilm Ltd. and/or its affiliates.
Star Wars Galaxies is a trademark of Lucasfilm Entertainment Company Ltd.
© 2004 Lucasfilm Entertainment Company Ltd. or Lucasfilm Ltd.
All rights reserved.

SOE and the SOE logo are registered trademarks of Sony Online Entertainment Inc. in the US and/or other countries.
</Text>
			</Page>
			<Image
				BackgroundOpacity='1.00'
				Location='227,48'
				Name='swgJTLJapan'
				PackLocation='cpc,cpc'
				PackSize='f,f'
				ScrollExtent='570,570'
				Size='570,570'
				SourceRect='0,0,512,512'
				SourceResource='ui_starwars_logo_jtl_japan'
				Style='splash'
			/>
		</Page>
	</Page>
